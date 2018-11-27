import 'dart:convert';

import 'package:bookshelf/book_card.dart';
import 'package:bookshelf/model/book_entry.dart';
import 'package:bookshelf/model/gbooks_response.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BookSearchPage extends StatefulWidget {
  final Function addEntry;

  BookSearchPage(this.addEntry);

  @override
  State<StatefulWidget> createState() {
    return _BookSearchPage();
  }
}

class _BookSearchPage extends State<BookSearchPage> {
  String _query = '';
  GBooksResponse results;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),

      /// consider switching to more performant builder
      child: ListView(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(labelText: 'Find a Book'),
            onChanged: (String value) {
              setState(() {
                _query = value;
                results = null;
                // TODO: set loading state
              });
              search();
              // either search here (as state changes) or add submit button
            },
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(child: _buildResults()),
        ],
      ),
    );
  }

  Widget _buildResults() {
    return results != null && results.totalItems > 0
        ? ListView.builder(
            itemBuilder: _buildResult,
            itemCount: results.totalItems,
          )
        : Center(
            child: Text('Start typing to show results!'),
          );
  }

  Widget _buildResult(BuildContext context, int index) {
    return GestureDetector(
      onTap: () => {
            //   onPressed: () {
            //     // final BookEntry entry = BookEntry(
            //     //   title: _query,
            //     //   authors: ['John', 'Jane'],
            //     //   description:
            //     //       'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
            //     //   imageLink: 'assets/placeholder.jpg',
            //     // );
            //     // widget.addEntry(entry);
            //     // Navigator.pushReplacementNamed(context, '/books');
            //   },
          },
      child: BookCard(results.items[index]),
    );
  }

  Future search() async {
    String url = 'https://www.googleapis.com/books/v1/volumes?q=$_query';
    print('executing search --> $url');
    // final jsonResponse = await http.get(url);
    // var jsonBody = json.decode(jsonResponse.body);
    // setState(() {
    //   results = GBooksResponse.fromJson(jsonBody);
    // });
    http
        .get(url)
        .then((jsonResponse) => json.decode(jsonResponse.body))
        .then((jsonBody) => GBooksResponse.fromJson(jsonBody))
        .then((gBooksRes) {
      setState(() {
        results = gBooksRes;
      });
    });
  }
}

// need to add button / action to create a new Entry from the output from
// the Google Books search

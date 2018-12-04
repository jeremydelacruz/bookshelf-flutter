import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:bookshelf/book_card.dart';
import 'package:bookshelf/model/gbooks_response.dart';

class BookSearchPage extends StatefulWidget {
  final Function addEntry;
  final Function retrieveGBooksKey;

  BookSearchPage(this.addEntry, this.retrieveGBooksKey);

  @override
  State<StatefulWidget> createState() {
    return _BookSearchPage(retrieveGBooksKey());
  }
}

class _BookSearchPage extends State<BookSearchPage> {
  static const Duration BUFFER = Duration(milliseconds: 500);
  final Future<String> _apiKey;
  String _query = '';
  GBooksResponse _results;
  int _changes = 0;

  _BookSearchPage(this._apiKey);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(labelText: 'Find a Book'),
            onChanged: (String value) {
              setState(() {
                _query = value.replaceAll(" ", "%20");
                _results = null;
                _changes++;
                _delaySearch();
              });
            },
          ),
          SizedBox(
            height: 10.0,
          ),
          Expanded(child: _buildResults()),
        ],
      ),
    );
  }

  /// build performant ListView
  Widget _buildResults() {
    return _results != null && _query.length > 0
        ? ListView.builder(
            itemBuilder: _buildResult,
            itemCount: _results.totalItems,
          )
        : Center(
            child: Text('Start typing to show results!'),
          );
  }

  /// build each visual entry in the ListView
  Widget _buildResult(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        widget.addEntry(_results.items[index]);
        Navigator.pushReplacementNamed(context, '/books');
      },
      child: BookCard(_results.items[index]),
    );
  }

  /// only execute the search if query hasn't been updated in 1 second
  void _delaySearch() {
    int currentChanges = _changes;
    Timer(BUFFER, () => _delaySearchHelper(currentChanges));
  }

  /// ensure no changes have been made since the last keystroke before searching
  void _delaySearchHelper(int changesSince) {
    if (changesSince == _changes) _search();
  }

  /// asynchronously search Google Books API volumes for user's query
  Future _search() async {
    // empty query
    if (_query.length == 0) {
      _results = null;
      return null;
    }

    String key = await _apiKey;
    String url =
        'https://www.googleapis.com/books/v1/volumes?q=$_query&key=$key';
    print("executing search... --> $url");

    // execute asynchronous search and set the state when it returns a result
    http
        .get(url)
        .then((jsonResponse) => json.decode(jsonResponse.body))
        .then((jsonBody) => GBooksResponse.fromJson(jsonBody))
        .then((gBooksRes) => setState(() {
              _results = gBooksRes;
            }));
  }
}

import 'package:bookshelf/model/book_entry.dart';
import 'package:flutter/material.dart';

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
              });
            },
          ),
          SizedBox(
            height: 10.0,
          ),
          RaisedButton(
            color: Theme.of(context).primaryColor,
            textColor: Colors.white,
            child: Text('[ADD]'),
            onPressed: () {
              /// replace this with custom object
              final BookEntry entry = BookEntry(
                title: _query,
                authors: ['John', 'Jane'],
                description: 'Placeholder description',
                imageLink: 'assets/placeholder.jpg',
              );
              // {
              //   'title': _query,
              //   'authors': ['John Doe', 'Jane Doe'],
              //   'description': 'placeholder',
              //   'image': 'assets/placeholder.jpg'
              // };
              widget.addEntry(entry);
              Navigator.pushReplacementNamed(context, '/books');
            },
          )
        ],
      ),
    );
  }
}

// need to add button / action to create a new Entry from the output from
// the Google Books search

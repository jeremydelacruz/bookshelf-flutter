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
              final Map<String, dynamic> entry = {
                'title': _query,
                'image': 'assets/placeholder.jpg'
              };
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

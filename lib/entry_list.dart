import 'package:flutter/material.dart';

import 'pages/book.dart';

class EntryList extends StatelessWidget {
  final List<Map<String, String>> entries;
  final Function deleteEntry;

  EntryList(this.entries, {this.deleteEntry});

  Widget _buildEntry(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(entries[index]['image']),
          Text(entries[index]['title']),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                child: Text('info'),
                onPressed: () => Navigator.pushNamed<bool>(
                            context, '/book/' + index.toString())
                        .then((bool value) {
                      if (value) deleteEntry(index);
                    }),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildEntryList() {
    return entries.length > 0
        ? ListView.builder(
            itemBuilder: _buildEntry,
            itemCount: entries.length,
          )
        : Center(
            child: Text('Your reading list is empty, try adding some'),
          );
  }

  /// this builder creates a more performant listview that
  /// only renders what's on screen
  @override
  Widget build(BuildContext context) {
    return _buildEntryList();
  }
}

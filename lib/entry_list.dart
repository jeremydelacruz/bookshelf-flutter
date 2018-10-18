import 'package:flutter/material.dart';

class EntryList extends StatelessWidget {
  final List<Map<String, dynamic>> entries;
  final Function deleteEntry;

  EntryList(this.entries, {this.deleteEntry});

  Widget _buildEntry(BuildContext context, int index) {
    return Card(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 120.0,
            width: 120.0,
            child: Image.asset(
              entries[index]['image'],
              fit: BoxFit.fitHeight,
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(5.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    child: Text(
                      entries[index]['title'],
                      style: TextStyle(
                        fontFamily: 'Raleway',
                        fontSize: 18.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  FlatButton(
                    color: Theme.of(context).primaryColor,
                    child: Text('[Details]'),
                    onPressed: () => Navigator.pushNamed<bool>(
                                context, '/book/${index.toString()}')
                            .then((bool value) {
                          if (value) deleteEntry(index);
                        }),
                  )
                ],
              ),
            ),
          ),
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
            child: Text('Your reading list is empty, try adding one!'),
          );
  }

  /// this builder creates a more performant listview that
  /// only renders what's on screen
  @override
  Widget build(BuildContext context) {
    return _buildEntryList();
  }
}

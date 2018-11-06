import 'package:bookshelf/model/book_entry.dart';
import 'package:flutter/material.dart';

/// The EntryList class serves as a stateless UI representation of the
/// collection of user-added book entries. It also provides the functionality
/// of tapping and deleting any book in the list. When a user taps an entry,
/// a page is opened where the full formatted details of that book are displayed.
class EntryList extends StatelessWidget {
  final List<BookEntry> entries;
  final Function deleteEntry;

  EntryList(this.entries, {this.deleteEntry});

  Widget _buildEntry(BuildContext context, int index) {
    return GestureDetector(
      onTap: () =>
          Navigator.pushNamed<bool>(context, '/book/${index.toString()}')
              .then((bool deleteWasPressed) {
            if (deleteWasPressed) deleteEntry(index);
          }),
      child: Card(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 120.0,
              width: 120.0,
              child: Image.asset(
                entries[index].imageLink,
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
                    // title component
                    Container(
                      child: Text(
                        entries[index].title,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 18.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    // TODO: authors component
                    // TODO: description component
                  ],
                ),
              ),
            ),
          ],
        ),
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

  /// this builder creates a more performant listview that only renders
  /// what's on screen
  @override
  Widget build(BuildContext context) {
    // TODO: add some text above the list
    return _buildEntryList();
  }
}

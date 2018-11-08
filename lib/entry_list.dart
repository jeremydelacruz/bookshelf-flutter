import 'package:bookshelf/book_card.dart';
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

  /// called for every UI list entry being built
  Widget _buildEntry(BuildContext context, int index) {
    return GestureDetector(
      onTap: () =>
          Navigator.pushNamed<bool>(context, '/book/${index.toString()}')
              .then((bool deleteWasPressed) {
            if (deleteWasPressed) deleteEntry(index);
          }),
      child: BookCard(entries[index]),
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
    return _buildEntryList();
  }
}

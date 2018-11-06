import 'package:bookshelf/model/book_entry.dart';
import 'package:flutter/material.dart';

import './entry_list.dart';

/// The EntryManager class serves as the stateless UI wrapper for the actual
/// EntryList list of book entries. It passes down the external state
/// (entries and the deleteEntry function reference) into the EntryList
class EntryManager extends StatelessWidget {
  final List<BookEntry> entries;
  final Function deleteEntry;

  EntryManager(this.entries, this.deleteEntry);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Container that expands to all remaining space
        Expanded(child: EntryList(entries, deleteEntry: deleteEntry)),
      ],
    );
  }
}

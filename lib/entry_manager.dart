import 'package:flutter/material.dart';

import './entry_list.dart';

class EntryManager extends StatelessWidget {
  final List<Map<String, dynamic>> entries;
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

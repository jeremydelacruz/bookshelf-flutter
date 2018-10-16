import 'package:flutter/material.dart';

import './entry_list.dart';
import './entry_control.dart';

class EntryManager extends StatelessWidget {
  final List<Map<String, String>> entries;
  final Function addEntry;
  final Function deleteEntry;

  EntryManager(this.entries, this.addEntry, this.deleteEntry);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // button for adding entries
        Container(
          margin: EdgeInsets.all(10.0),
          child: EntryControl(addEntry),
        ),
        // Container that expands to all remaining space
        Expanded(child: EntryList(entries, deleteEntry: deleteEntry)),
      ],
    );
  }
}

import 'package:flutter/material.dart';

import '../entry_manager.dart';

class BooksPage extends StatelessWidget {
  final List<Map<String, String>> entries;
  final Function addEntry;
  final Function deleteEntry;

  BooksPage(this.entries, this.addEntry, this.deleteEntry);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            AppBar(
              automaticallyImplyLeading: false,
              title: Text('Menu'),
            ),
            ListTile(
              title: Text('Manage your Bookshelf'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/manage');
              },
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Your Bookshelf'),
      ),
      body: EntryManager(entries, addEntry, deleteEntry),
    );
  }
}

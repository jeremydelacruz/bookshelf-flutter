import 'package:flutter/material.dart';

import './books.dart';
import './book_search.dart';
import './edit_books.dart';

class ManageBooksPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              AppBar(
                automaticallyImplyLeading: false,
                title: Text('Menu'),
              ),
              ListTile(
                title: Text('Your Bookshelf'),
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/');
                },
              )
            ],
          ),
        ),
        appBar: AppBar(
          title: Text('Manage your Bookshelf'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.search),
                text: 'Search for Books',
              ),
              Tab(
                icon: Icon(Icons.edit),
                text: 'Edit your Books',
              )
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[BookSearchPage(), EditBooksPage()],
        ),
      ),
    );
  }
}

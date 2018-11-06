import 'package:bookshelf/model/book_entry.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import './pages/auth.dart';
import './pages/book.dart';
import './pages/books.dart';
import './pages/manage_books.dart';

void main() => runApp(BookshelfApp());

///
class BookshelfApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BookshelfAppState();
  }
}

///
class _BookshelfAppState extends State<BookshelfApp> {
  List<BookEntry> _entries = [];

  /// adds an entry to the list and updates state
  void _addEntry(BookEntry entry) {
    setState(() {
      _entries.add(entry);
    });
  }

  /// deletes an entry from the list and updates state
  void _deleteEntry(int index) {
    setState(() {
      _entries.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.primaries[5],
          fontFamily: 'Raleway'),
      routes: {
        '/': (BuildContext context) => AuthPage(),
        '/books': (BuildContext context) => BooksPage(_entries, _deleteEntry),
        '/manage': (BuildContext context) =>
            ManageBooksPage(_addEntry, _deleteEntry),
      },
      // routes with dynamic params
      onGenerateRoute: (RouteSettings settings) {
        // format: '/book/idx'
        final List<String> pathElements = settings.name.split('/');
        if (pathElements[0] != '') {
          return null;
        }
        if (pathElements[1] == 'book') {
          final int index = int.parse(pathElements[2]);
          return MaterialPageRoute<bool>(
              // TODO: find good way to pass this info
              builder: (BuildContext context) => BookPage(
                    _entries[index].title,
                    _entries[index].authors,
                    _entries[index].description,
                    _entries[index].imageLink,
                  ));
        }
        return null;
      },
      // bad route
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          builder: (BuildContext context) => BooksPage(_entries, _deleteEntry),
        );
      },
    );
  }
}

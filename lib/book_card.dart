import 'package:flutter/material.dart';
import 'package:bookshelf/model/book_entry.dart';

class BookCard extends StatelessWidget {
  static const String PLACEHOLDER = "assets/placeholder.jpg";
  final BookEntry entry;

  BookCard(this.entry);

  /// constructs a card for a book at a given index in the list
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 120.0,
            width: 120.0,
            child: entry.imageLink == null
                ? Image.asset(
                    PLACEHOLDER,
                    fit: BoxFit.fitHeight,
                  )
                : Image.network(
                    entry.imageLink,
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
                  _titleComponent(entry.title),
                  _authorComponent(entry.authors),
                  _descriptionComponent(entry.description),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _titleComponent(String title) {
    return Container(
      child: Text(
        title,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontFamily: 'Raleway',
          fontSize: 20.0,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }

  Container _authorComponent(List<String> authors) {
    return Container(
      child: Text(
        'by ' + _stringifyList(authors),
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontFamily: 'Raleway',
          fontSize: 16.0,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Container _descriptionComponent(String description) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.0),
      height: 60.0,
      child: Text(
        description,
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontFamily: 'Raleway',
          fontSize: 16.0,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }

  String _stringifyList(List<String> list) {
    String result = '';
    list.forEach((element) {
      if (result.length > 0) result += ', ';
      result += element;
    });
    return result.length > 0 ? result : "Anonymous";
  }
}

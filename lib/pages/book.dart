import 'dart:async';
import 'package:flutter/material.dart';

class BookPage extends StatelessWidget {
  static const String PLACEHOLDER = "assets/placeholder.jpg";
  final String title;
  final List<String> authors;
  final String description;
  final String imageUrl;

  BookPage(this.title, this.authors, this.description, this.imageUrl);

  _showWarningDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Are you sure?'),
            content: Text('This cannot be undone!'),
            actions: <Widget>[
              FlatButton(
                child: Text('Cancel'),
                onPressed: () => Navigator.pop(context),
              ),
              FlatButton(
                child: Text('Remove'),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context, true);
                },
              ),
            ],
          );
        });
  }

  Image _renderImage() {
    return imageUrl == null
        ? Image.asset(
            PLACEHOLDER,
            height: 200,
          )
        : Image.network(
            imageUrl,
            height: 200,
          );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context, false);
        return Future.value(false); // true pops again, crashing the app
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10.0),
              child: _renderImage(),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Text(
                description,
                style: TextStyle(fontSize: 18),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: RaisedButton(
                //color: Theme.of(context).accentColor,
                color: Colors.red,
                textColor: Colors.white,
                child: Text('Remove from bookshelf'),
                onPressed: () => _showWarningDialog(context),
              ),
            )
          ],
        ),
      ),
    );
  }
}

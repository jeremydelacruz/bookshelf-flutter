import 'package:flutter/material.dart';

class BookSearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        child: Text('Test Modal'),
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return Center(
                  child: Text('This is a modal!'),
                );
              });
        },
      ),
    );
  }
}

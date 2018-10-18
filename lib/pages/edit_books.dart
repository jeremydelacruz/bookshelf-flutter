import 'package:flutter/material.dart';

class EditBooksPage extends StatelessWidget {
  final Function deleteEntry;

  EditBooksPage(this.deleteEntry);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('This is the edit page'),
    );
  }
}

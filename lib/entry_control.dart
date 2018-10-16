import 'package:flutter/material.dart';

class EntryControl extends StatelessWidget {
  final Function addEntry;

  EntryControl(this.addEntry);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Colors.white,
      onPressed: () {
        addEntry({'title': 'placeholder', 'image': 'assets/placeholder.jpg'});
      },
      child: Text('Add'),
    );
  }
}

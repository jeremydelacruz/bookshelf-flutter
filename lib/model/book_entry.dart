//import 'package:flutter/material.dart';

import 'isbn.dart';

class BookEntry {
  String _title;
  List<String> _authors;
  String _description;
  Isbn _isbn;
  String _imageLink;
  //Image _image;
  String _url;

  BookEntry(
    this._title,
    this._authors,
    this._description,
    this._isbn,
    this._imageLink,
    //this._image,
    this._url,
  );

  String get title => this._title;
  List<String> get authors => this._authors;
  String get description => this._description;
  Isbn get isbn => this._isbn;
  String get url => this._url;
  String get imageLink => this._imageLink;
  //Object get image => this._image;

  /// knows how to build itself from json
  factory BookEntry.fromJson(Map<String, dynamic> parsedJson) {
    var volumeInfo = parsedJson['volumeInfo'];
    List<String> authors = List<String>.from(volumeInfo['authors']);
    return BookEntry(
      volumeInfo['title'],
      authors,
      volumeInfo['description'],
      Isbn.fromJson(volumeInfo['industryIdentifiers']),
      volumeInfo['imageLinks']['thumbnail'],
      //null,
      parsedJson['selfLink'],
    );
  }
}

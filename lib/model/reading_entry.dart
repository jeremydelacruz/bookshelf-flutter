import 'package:bookshelf/model/isbn.dart';

// can be used as an implicit interface that cannot be instantiated
///
abstract class ReadingEntry {
  // private fields
  final String _title;
  final List<String> _authors;
  final String _description;
  final Isbn _isbn;
  final String _url;
  final String _imageLink;
  // public
  final Object _image;

  ReadingEntry(
    this._title,
    this._authors,
    this._description, [
    this._imageLink,
    this._image,
    this._isbn,
    this._url,
  ]);

  String get title => this._title;
  List<String> get authors => this._authors;
  String get description => this._description;
  Isbn get isbn => this._isbn;
  String get url => this._url;
  String get imageLink => this._imageLink;
  Object get image;
}

import 'package:bookshelf/components/isbn.dart';

// can be used as an implicit interface that cannot be instantiated
///
abstract class ReadingEntry {
  // private fields
  final String _title;
  final List<String> _authors;
  final Isbn _isbn;
  final String _url;
  final String _imageLink;
  // public
  final Object _image;

  ReadingEntry(
      this._title,
      this._authors,
      [this._isbn, this._url, this._imageLink, this._image]
      );

  String get title => this._title;
  List<String> get authors => this._authors;
  Isbn get isbn => this._isbn;
  String get url => this._url;
  String get imageLink => this._imageLink;
  Object get image;

}
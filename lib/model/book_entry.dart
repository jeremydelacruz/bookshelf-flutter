import 'isbn.dart';

class BookEntry {
  String _title;
  List<String> _authors;
  String _description;
  Isbn _isbn;
  String _imageLink;
  String _url;

  BookEntry(
    this._title,
    this._authors,
    this._description,
    this._isbn,
    this._imageLink,
    this._url,
  );

  String get title => this._title ?? "Untitled";
  List<String> get authors => this._authors;
  String get description => this._description ?? "No description available.";
  Isbn get isbn => this._isbn;
  String get url => this._url;
  String get imageLink => this._imageLink;

  /// knows how to build itself from json
  factory BookEntry.fromJson(dynamic parsedJson) {
    var volumeInfo = parsedJson['volumeInfo'];
    List<String> authors = List();
    var authorJson = volumeInfo['authors'];
    authorJson?.forEach((author) => authors.add(author));
    var imageLinks = volumeInfo['imageLinks'];
    var thumbnail = imageLinks != null ? imageLinks['smallThumbnail'] : null;

    return BookEntry(
      volumeInfo['title'],
      authors,
      volumeInfo['description'],
      Isbn.fromJson(volumeInfo['industryIdentifiers'] ?? List()),
      thumbnail,
      parsedJson['selfLink'],
    );
  }
}

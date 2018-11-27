/// Value Object for ISBN
class Isbn {
  static const String ISBN10 = "ISBN_10";
  static const String ISBN13 = "ISBN_13";
  final String _isbn10;
  final String _isbn13;

  Isbn(this._isbn10, this._isbn13);

  bool equals(Isbn other) =>
      (this._isbn10 == other.isbn10 && this._isbn13 == other.isbn13);

  String get isbn10 => this._isbn10;
  String get isbn13 => this._isbn13;

  factory Isbn.fromJson(dynamic parsedJson) {
    var isbnList = parsedJson as List;
    String id10, id13;
    for (var id in isbnList) {
      if (id['type'] == ISBN10) {
        id10 = id['identifier'];
      } else if (id['type'] == ISBN13) {
        id13 = id['identifier'];
      }
    }
    return Isbn(id10, id13);
  }
}

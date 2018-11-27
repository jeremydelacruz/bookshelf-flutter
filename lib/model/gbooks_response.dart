import 'package:bookshelf/model/book_entry.dart';

/// represents entire JSON response from Google Books API
class GBooksResponse {
  final int totalItems;
  final String kind;
  final List<BookEntry> items;

  GBooksResponse({this.items, this.kind, this.totalItems});

  /// builds itself from json
  factory GBooksResponse.fromJson(dynamic parsedJson) {
    var list = parsedJson['items'] as List;

    List<BookEntry> itemList = list.map((i) => BookEntry.fromJson(i)).toList();

    return GBooksResponse(
        items: itemList,
        kind: parsedJson['kind'],
        totalItems: parsedJson['totalItems']);
  }
}

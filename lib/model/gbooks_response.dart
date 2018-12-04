import 'package:bookshelf/model/book_entry.dart';

/// represents entire JSON response from Google Books API
class GBooksResponse {
  final int _totalItems;
  final String _kind;
  final List<BookEntry> _items;

  GBooksResponse(this._items, this._kind, this._totalItems);

  int get totalItems => _items.length ?? 0;
  String get kind => _kind;
  List<BookEntry> get items => _items;

  /// builds itself from json
  factory GBooksResponse.fromJson(dynamic parsedJson) {
    var list = parsedJson['items'] as List;

    List<BookEntry> itemList = list.map((i) => BookEntry.fromJson(i)).toList();

    return GBooksResponse(
        itemList, parsedJson['kind'], parsedJson['totalItems']);
  }
}

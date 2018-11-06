import 'reading_entry.dart';
import 'isbn.dart';

class BookEntry extends ReadingEntry {
  // TODO
  BookEntry({
    String title = '',
    List<String> authors,
    String description,
    Isbn isbn, // replace with String and build the ISBN here
    String imageLink = '',
    Object image,
  }) : super(
          title,
          authors,
          description,
          imageLink,
        );

  // TODO: implement image
  @override
  Object get image => null;
}

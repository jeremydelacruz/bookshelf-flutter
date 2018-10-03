/// Value Object for ISBN
class Isbn {
  final String isbn10;
  final String isbn13;

  Isbn(this.isbn10 , this.isbn13);

  bool equals(Isbn other) => (
      this.isbn10 == other.isbn10 && this.isbn13 == other.isbn13
  );
}
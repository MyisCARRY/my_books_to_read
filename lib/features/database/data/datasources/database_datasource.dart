import 'package:my_books_to_read/features/books/domain/models/book.dart';

abstract class DatabaseDatasource {
  Future<List<Book>> getFavoriteBooks();

  Future<bool> addFavoriteBook(Book book);

  Future<bool> removeFavoriteBook(Book book);
}

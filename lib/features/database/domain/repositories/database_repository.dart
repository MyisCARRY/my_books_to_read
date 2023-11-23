import 'package:my_books_to_read/core/app/type_aliases.dart';
import 'package:my_books_to_read/features/books/domain/models/book.dart';

abstract class DatabaseRepository {
  FutureFailable<List<Book>> getFavoriteBooks();

  FutureFailable<bool> addFavoriteBook(Book book);

  FutureFailable<bool> removeFavoriteBook(Book book);
}

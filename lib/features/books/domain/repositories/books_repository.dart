import 'package:my_books_to_read/core/app/type_aliases.dart';
import 'package:my_books_to_read/features/books/domain/models/book.dart';
import 'package:my_books_to_read/features/books/domain/models/search_books_param.dart';

abstract class BooksRepository {
  FutureFailable<List<Book>> searchBooks(SearchBooksParam param);
}

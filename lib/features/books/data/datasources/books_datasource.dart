import 'package:my_books_to_read/features/books/domain/models/book.dart';
import 'package:my_books_to_read/features/books/domain/models/search_books_param.dart';

abstract class BooksDatasource {
  Future<List<Book>> searchBooks(SearchBooksParam param);
}

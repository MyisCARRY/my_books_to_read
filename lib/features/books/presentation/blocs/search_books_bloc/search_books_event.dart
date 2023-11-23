import 'package:my_books_to_read/features/books/domain/models/book.dart';
import 'package:my_books_to_read/features/books/domain/models/search_books_param.dart';

sealed class SearchBooksEvent {}

class Search extends SearchBooksEvent {
  Search({
    required this.param,
  });

  final SearchBooksParam param;
}

class UpdateFavoriteBooks extends SearchBooksEvent {
  UpdateFavoriteBooks({required this.books});

  final List<Book> books;
}

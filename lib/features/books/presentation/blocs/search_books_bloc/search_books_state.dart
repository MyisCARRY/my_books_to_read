import 'package:my_books_to_read/core/error/failures.dart';
import 'package:my_books_to_read/features/books/domain/models/book.dart';

sealed class SearchBooksState {}

class InitialState extends SearchBooksState {}

class EmptySearchState extends SearchBooksState {}

class LoadingState extends SearchBooksState {}

class ErrorState extends SearchBooksState {
  ErrorState({
    required this.failure,
  });

  final Failure failure;
}

class DataState extends SearchBooksState {
  DataState({
    required this.books,
  });

  final List<Book> books;
}

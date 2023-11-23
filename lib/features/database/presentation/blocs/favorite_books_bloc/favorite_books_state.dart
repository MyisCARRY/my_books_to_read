import 'package:my_books_to_read/core/error/failures.dart';
import 'package:my_books_to_read/features/books/domain/models/book.dart';

sealed class FavoriteBooksState {}

class LoadingState extends FavoriteBooksState {}

class ErrorState extends FavoriteBooksState {
  ErrorState({required this.failure});

  final Failure failure;
}

class EmptyState extends FavoriteBooksState {}

class DataState extends FavoriteBooksState {
  DataState({required this.books});

  final List<Book> books;
}

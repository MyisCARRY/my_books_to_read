import 'package:my_books_to_read/core/app/type_aliases.dart';
import 'package:my_books_to_read/core/usecase/usecase.dart';
import 'package:my_books_to_read/features/books/domain/models/book.dart';
import 'package:my_books_to_read/features/books/domain/models/search_books_param.dart';
import 'package:my_books_to_read/features/books/domain/repositories/books_repository.dart';

class SearchBooksUsecase extends Usecase<List<Book>, SearchBooksParam> {
  SearchBooksUsecase({
    required this.repository,
  });

  final BooksRepository repository;

  @override
  FutureFailable<List<Book>> call(SearchBooksParam params) {
    return repository.searchBooks(params);
  }
}

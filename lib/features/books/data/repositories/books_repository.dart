import 'package:my_books_to_read/core/app/type_aliases.dart';
import 'package:my_books_to_read/core/error/failures.dart';
import 'package:my_books_to_read/core/error/repository_request_handler.dart';
import 'package:my_books_to_read/features/books/data/datasources/books_datasource.dart';
import 'package:my_books_to_read/features/books/domain/models/book.dart';
import 'package:my_books_to_read/features/books/domain/models/search_books_param.dart';
import 'package:my_books_to_read/features/books/domain/repositories/books_repository.dart';

class BooksRepositoryImpl extends BooksRepository {
  BooksRepositoryImpl({
    required this.datasource,
  });

  final BooksDatasource datasource;

  @override
  FutureFailable<List<Book>> searchBooks(SearchBooksParam param) {
    return RepositoryRequestHandler<List<Book>>()(
      request: () => datasource.searchBooks(param),
      defaultFailure: SearchBooksFailure(),
    );
  }
}

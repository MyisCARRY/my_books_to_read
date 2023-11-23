import 'package:my_books_to_read/core/app/type_aliases.dart';
import 'package:my_books_to_read/core/error/failures.dart';
import 'package:my_books_to_read/core/error/repository_request_handler.dart';
import 'package:my_books_to_read/features/books/domain/models/book.dart';
import 'package:my_books_to_read/features/database/data/datasources/database_datasource.dart';
import 'package:my_books_to_read/features/database/domain/repositories/database_repository.dart';

class DatabaseRepositoryImpl extends DatabaseRepository {
  DatabaseRepositoryImpl({
    required this.datasource,
  });

  final DatabaseDatasource datasource;

  @override
  FutureFailable<bool> addFavoriteBook(Book book) {
    return RepositoryRequestHandler<bool>()(
      request: () => datasource.addFavoriteBook(book),
      defaultFailure: AddFavoriteBookFailure(),
    );
  }

  @override
  FutureFailable<List<Book>> getFavoriteBooks() {
    return RepositoryRequestHandler<List<Book>>()(
      request: datasource.getFavoriteBooks,
      defaultFailure: GetFavoriteBooksFailure(),
    );
  }

  @override
  FutureFailable<bool> removeFavoriteBook(Book book) {
    return RepositoryRequestHandler<bool>()(
      request: () => datasource.removeFavoriteBook(book),
      defaultFailure: RemoveFavoriteBookFailure(),
    );
  }
}

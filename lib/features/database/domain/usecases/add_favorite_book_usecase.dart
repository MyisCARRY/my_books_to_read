import 'package:my_books_to_read/core/app/type_aliases.dart';
import 'package:my_books_to_read/core/usecase/usecase.dart';
import 'package:my_books_to_read/features/books/domain/models/book.dart';
import 'package:my_books_to_read/features/database/domain/repositories/database_repository.dart';

class AddFavoriteBookUsecase extends Usecase<bool, Book> {
  AddFavoriteBookUsecase({
    required this.repository,
  });

  final DatabaseRepository repository;

  @override
  FutureFailable<bool> call(Book params) {
    return repository.addFavoriteBook(params);
  }
}

import 'package:any_animated_button/any_animated_button.dart';
import 'package:dartz/dartz.dart';
import 'package:my_books_to_read/core/error/failures.dart';
import 'package:my_books_to_read/features/books/domain/models/book.dart';
import 'package:my_books_to_read/features/database/domain/usecases/add_favorite_book_usecase.dart';

class AddFavoriteBookBloc extends AnyAnimatedButtonBloc<Book, bool, Failure> {
  AddFavoriteBookBloc({required this.addFavoriteBookUsecase});

  final AddFavoriteBookUsecase addFavoriteBookUsecase;

  @override
  Future<Either<Failure, bool>> asyncAction(Book input) {
    return addFavoriteBookUsecase(input);
  }
}

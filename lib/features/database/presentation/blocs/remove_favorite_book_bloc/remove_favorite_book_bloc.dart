import 'package:any_animated_button/any_animated_button.dart';
import 'package:dartz/dartz.dart';
import 'package:my_books_to_read/core/error/failures.dart';
import 'package:my_books_to_read/features/books/domain/models/book.dart';
import 'package:my_books_to_read/features/database/domain/usecases/remove_favorite_book_usecase.dart';

class RemoveFavoriteBookBloc extends AnyAnimatedButtonBloc<Book, bool, Failure> {
  RemoveFavoriteBookBloc({required this.removeFavoriteBookUsecase});

  final RemoveFavoriteBookUsecase removeFavoriteBookUsecase;

  @override
  Future<Either<Failure, bool>> asyncAction(Book input) {
    return removeFavoriteBookUsecase(input);
  }
}

import 'package:equatable/equatable.dart';
import 'package:my_books_to_read/generated/l10n.dart';

abstract class Failure extends Equatable {
  @override
  List<Object> get props => [errorMessage];

  String get _errorMessage;

  int get _errorCode;

  String get errorMessage => '$_errorMessage \nec_$_errorCode';
}

abstract class BooksFailure extends Failure {}

class SearchBooksFailure extends BooksFailure {
  @override
  int get _errorCode => 100;

  @override
  String get _errorMessage => S.current.searchBooksFailure;
}

abstract class DatabaseFailure extends Failure {}

class AddFavoriteBookFailure extends BooksFailure {
  @override
  int get _errorCode => 200;

  @override
  String get _errorMessage => S.current.addFavoriteBookFailure;
}

class GetFavoriteBooksFailure extends BooksFailure {
  @override
  int get _errorCode => 201;

  @override
  String get _errorMessage => S.current.getFavoriteBooksFailure;
}

class RemoveFavoriteBookFailure extends BooksFailure {
  @override
  int get _errorCode => 202;

  @override
  String get _errorMessage => S.current.removeFavoriteBookFailure;
}

import 'package:equatable/equatable.dart';
import 'package:my_books_to_read/core/app/type_aliases.dart';

abstract class Usecase<Type, Params> {
  FutureFailable<Type> call(final Params params);
}

class NoParams extends Equatable {
  const NoParams();

  @override
  List<Object> get props => [];
}

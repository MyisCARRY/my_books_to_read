import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_books_to_read/core/usecase/usecase.dart';
import 'package:my_books_to_read/features/database/domain/usecases/get_favorite_books_usecase.dart';
import 'package:my_books_to_read/features/database/presentation/blocs/favorite_books_bloc/favorite_books_event.dart';
import 'package:my_books_to_read/features/database/presentation/blocs/favorite_books_bloc/favorite_books_state.dart';

class FavoriteBooksBloc extends Bloc<FavoriteBooksEvent, FavoriteBooksState> {
  FavoriteBooksBloc({
    required this.getFavoriteBooksUsecase,
  }) : super(LoadingState()) {
    on<LoadFavoriteBooks>(_loadFavoriteBooks);
  }

  final GetFavoriteBooksUsecase getFavoriteBooksUsecase;

  Future _loadFavoriteBooks(LoadFavoriteBooks event, Emitter<FavoriteBooksState> emit) async {
    emit(LoadingState());
    final result = await getFavoriteBooksUsecase(const NoParams());
    result.fold(
      (failure) => emit(ErrorState(failure: failure)),
      (data) => data.isEmpty ? emit(EmptyState()) : emit(DataState(books: data)),
    );
  }
}

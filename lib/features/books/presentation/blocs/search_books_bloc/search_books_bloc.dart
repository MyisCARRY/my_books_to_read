import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_books_to_read/core/style/duration.dart';
import 'package:my_books_to_read/features/books/domain/models/book.dart';
import 'package:my_books_to_read/features/books/domain/usecases/search_books_usecase.dart';
import 'package:my_books_to_read/features/books/presentation/blocs/search_books_bloc/search_books_event.dart';
import 'package:my_books_to_read/features/books/presentation/blocs/search_books_bloc/search_books_state.dart';
import 'package:rxdart/rxdart.dart';

class SearchBooksBloc extends Bloc<SearchBooksEvent, SearchBooksState> {
  SearchBooksBloc({
    required this.searchBooksUsecase,
  }) : super(InitialState()) {
    on<Search>(_search, transformer: (events, mapper) {
      return events.debounceTime(MyDurations.duration300ms).asyncExpand(mapper);
    });
    on<UpdateFavoriteBooks>(_updateFavoriteBooks);
  }

  final SearchBooksUsecase searchBooksUsecase;
  List<Book> _favoriteBooks = [];
  List<Book> _searchedBooks = [];

  SearchBooksState get _data => _searchedBooks.isEmpty ? EmptySearchState() : DataState(books: List.of(_searchedBooks));

  Future _search(Search event, Emitter<SearchBooksState> emit) async {
    if (3 <= event.param.phrase.length) {
      emit(LoadingState());

      final result = await searchBooksUsecase(event.param);
      result.fold(
        (failure) => emit(ErrorState(failure: failure)),
        (data) {
          _searchedBooks = data;
          _checkForFavorites();
          emit(_data);
        },
      );
    }
  }

  Future _updateFavoriteBooks(UpdateFavoriteBooks event, Emitter<SearchBooksState> emit) async {
    _favoriteBooks = event.books;
    _checkForFavorites();
    emit(_data);
  }

  void _checkForFavorites() {
    for (int i = 0; i < _searchedBooks.length; i++) {
      if (_favoriteBooks.any((b) => b.id == _searchedBooks[i].id)) {
        _searchedBooks[i] = _searchedBooks[i].copyWith(favorite: true);
      } else {
        _searchedBooks[i] = _searchedBooks[i].copyWith(favorite: false);
      }
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_books_to_read/core/presentation/widgets/default_loading_widget.dart';
import 'package:my_books_to_read/core/style/paddings.dart';
import 'package:my_books_to_read/core/style/text_styles.dart';
import 'package:my_books_to_read/features/books/domain/enums/search_books_type_enum.dart';
import 'package:my_books_to_read/features/books/domain/models/search_books_param.dart';
import 'package:my_books_to_read/features/books/presentation/blocs/search_books_bloc/search_books_bloc.dart';
import 'package:my_books_to_read/features/books/presentation/blocs/search_books_bloc/search_books_event.dart';
import 'package:my_books_to_read/features/books/presentation/blocs/search_books_bloc/search_books_state.dart';
import 'package:my_books_to_read/features/books/presentation/blocs/search_books_type_cubit/search_books_type_cubit.dart';
import 'package:my_books_to_read/features/books/presentation/screens/favorite_books_screen.dart';
import 'package:my_books_to_read/features/books/presentation/widgets/books_list.dart';
import 'package:my_books_to_read/features/books/presentation/widgets/search_books_type_widget.dart';
import 'package:my_books_to_read/features/database/presentation/blocs/favorite_books_bloc/favorite_books_bloc.dart';
import 'package:my_books_to_read/features/database/presentation/blocs/favorite_books_bloc/favorite_books_event.dart';
import 'package:my_books_to_read/features/database/presentation/blocs/favorite_books_bloc/favorite_books_state.dart'
    as fb;
import 'package:my_books_to_read/generated/l10n.dart';
import 'package:my_books_to_read/injection_container.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late final SearchBooksBloc _searchBooksBloc;
  late final FavoriteBooksBloc _favoriteBooksBloc;
  late final SearchBooksTypeCubit _searchBooksTypeCubit;
  late final TextEditingController _searchPhraseController;

  @override
  void initState() {
    super.initState();

    _searchBooksBloc = sl();
    _favoriteBooksBloc = sl()..add(LoadFavoriteBooks());
    _searchBooksTypeCubit = sl();
    _searchPhraseController = TextEditingController();
  }

  @override
  void dispose() {
    _searchBooksTypeCubit.close();
    _searchPhraseController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: _favoriteBooksBloc,
      listener: (BuildContext context, fb.FavoriteBooksState state) {
        switch (state) {
          case fb.DataState():
            _searchBooksBloc.add(UpdateFavoriteBooks(books: state.books));
            break;
          case fb.EmptyState():
            _searchBooksBloc.add(UpdateFavoriteBooks(books: []));
            break;
          case fb.LoadingState():
          case fb.ErrorState():
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: Paddings.horizontal22,
            child: Column(
              children: [
                const SizedBox(height: 22.0),
                BlocBuilder(
                  bloc: _searchBooksTypeCubit,
                  builder: (BuildContext context, SearchBooksTypeEnum searchType) {
                    return TextField(
                      controller: _searchPhraseController,
                      onChanged: (text) => _searchBooksBloc.add(Search(
                        param: SearchBooksParam(
                          phrase: text,
                          bookSearchType: searchType,
                        ),
                      )),
                    );
                  },
                ),
                const SizedBox(height: 16.0),
                BlocConsumer(
                  bloc: _searchBooksTypeCubit,
                  listener: (BuildContext context, SearchBooksTypeEnum searchType) {
                    _searchBooksBloc.add(Search(
                      param: SearchBooksParam(
                        phrase: _searchPhraseController.text,
                        bookSearchType: searchType,
                      ),
                    ));
                  },
                  builder: (BuildContext context, SearchBooksTypeEnum searchType) {
                    return SearchBooksTypeWidget(
                      currentSearchType: searchType,
                      onChange: (newSearchType) => _searchBooksTypeCubit.change(newSearchType),
                    );
                  },
                ),
                const SizedBox(height: 16.0),
                BlocConsumer(
                  bloc: _searchBooksBloc,
                  listener: (BuildContext context, SearchBooksState state) {},
                  builder: (BuildContext context, SearchBooksState state) {
                    switch (state) {
                      case InitialState():
                        return const SizedBox();
                      case EmptySearchState():
                        return Text(S.current.noResults, style: roboto.s18.colorBlack);
                      case LoadingState():
                        return const DefaultLoadingWidget();
                      case ErrorState():
                        return Text(state.failure.errorMessage, style: roboto.s18.colorBlack);
                      case DataState():
                        return Expanded(child: BooksList(books: state.books));
                    }
                  },
                ),
                const SizedBox(height: 16.0),
                TextButton(
                  onPressed: () => const FavoriteBooksScreen().addScreen(context),
                  child: Text(S.current.favoriteBooks),
                ),
                const SizedBox(height: 22.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

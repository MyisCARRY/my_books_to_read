import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_books_to_read/core/navigator/navigator.dart';
import 'package:my_books_to_read/core/presentation/widgets/default_error_widget.dart';
import 'package:my_books_to_read/core/presentation/widgets/default_loading_widget.dart';
import 'package:my_books_to_read/core/presentation/widgets/notifications.dart';
import 'package:my_books_to_read/features/books/presentation/widgets/books_list.dart';
import 'package:my_books_to_read/features/database/presentation/blocs/favorite_books_bloc/favorite_books_bloc.dart';
import 'package:my_books_to_read/features/database/presentation/blocs/favorite_books_bloc/favorite_books_event.dart';
import 'package:my_books_to_read/features/database/presentation/blocs/favorite_books_bloc/favorite_books_state.dart';
import 'package:my_books_to_read/generated/l10n.dart';
import 'package:my_books_to_read/injection_container.dart';

class FavoriteBooksScreen extends StatefulWidget with NavigatedScreen {
  const FavoriteBooksScreen({Key? key}) : super(key: key);

  @override
  _FavoriteBooksScreenState createState() => _FavoriteBooksScreenState();

  @override
  String get routeName => 'FavoriteBooksScreen';
}

class _FavoriteBooksScreenState extends State<FavoriteBooksScreen> {
  late final FavoriteBooksBloc _favoriteBooksBloc;

  @override
  void initState() {
    super.initState();

    _favoriteBooksBloc = sl()..add(LoadFavoriteBooks());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: BlocConsumer(
          bloc: _favoriteBooksBloc,
          listener: (BuildContext context, FavoriteBooksState state) {
            switch (state) {
              case ErrorState():
                Notifications.error(failure: state.failure);
                break;
              case LoadingState():
              case EmptyState():
              case DataState():
                break;
            }
          },
          builder: (BuildContext context, FavoriteBooksState state) {
            switch (state) {
              case LoadingState():
                return const DefaultLoadingWidget();
              case ErrorState():
                return DefaultErrorWidget(onRefresh: () => _favoriteBooksBloc.add(LoadFavoriteBooks()));
              case EmptyState():
                return Center(
                  child: Text(S.current.noResults),
                );
              case DataState():
                return BooksList(books: state.books);
            }
          },
        ),
      ),
    );
  }
}

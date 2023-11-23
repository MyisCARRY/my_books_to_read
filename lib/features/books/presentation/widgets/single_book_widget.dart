import 'package:any_animated_button/any_animated_button.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_books_to_read/core/app/images.dart';
import 'package:my_books_to_read/core/presentation/widgets/buttons/favorite_button.dart';
import 'package:my_books_to_read/core/presentation/widgets/notifications.dart';
import 'package:my_books_to_read/core/style/text_styles.dart';
import 'package:my_books_to_read/features/books/domain/models/book.dart';
import 'package:my_books_to_read/features/database/presentation/blocs/add_favorite_book_bloc/add_favorite_book_bloc.dart';
import 'package:my_books_to_read/features/database/presentation/blocs/favorite_books_bloc/favorite_books_bloc.dart';
import 'package:my_books_to_read/features/database/presentation/blocs/favorite_books_bloc/favorite_books_event.dart';
import 'package:my_books_to_read/features/database/presentation/blocs/remove_favorite_book_bloc/remove_favorite_book_bloc.dart';
import 'package:my_books_to_read/injection_container.dart';

class SingleBookWidget extends StatefulWidget {
  const SingleBookWidget({
    required this.book,
    Key? key,
  }) : super(key: key);

  final Book book;

  @override
  State<SingleBookWidget> createState() => _SingleBookWidgetState();
}

class _SingleBookWidgetState extends State<SingleBookWidget> {
  late final AddFavoriteBookBloc _addFavoriteBookBloc;
  late final RemoveFavoriteBookBloc _removeFavoriteBookBloc;

  @override
  void initState() {
    super.initState();

    _addFavoriteBookBloc = sl();
    _removeFavoriteBookBloc = sl();
  }

  @override
  void dispose() {
    _addFavoriteBookBloc.close();
    _removeFavoriteBookBloc.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        AnyAnimatedButtonBlocListener(
          bloc: _addFavoriteBookBloc,
          onSuccessStart: (_) => sl<FavoriteBooksBloc>()..add(LoadFavoriteBooks()),
          onErrorStart: (failure) => Notifications.error(failure: failure),
        ),
        AnyAnimatedButtonBlocListener(
          bloc: _removeFavoriteBookBloc,
          onSuccessStart: (_) => sl<FavoriteBooksBloc>()..add(LoadFavoriteBooks()),
          onErrorStart: (failure) => Notifications.error(failure: failure),
        ),
      ],
      child: Column(
        children: [
          Flexible(
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: CachedNetworkImage(
                imageUrl: widget.book.coverImage,
                placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Image.asset(JpgImages.placeholder),
              ),
            ),
          ),
          const SizedBox(height: 4.0),
          Text(
            widget.book.title,
            style: roboto.s18.w600.colorBlack,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 2.0),
          Text(
            widget.book.getAuthorsString(),
            style: roboto.s16.w300.colorBlack,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4.0),
          FavoriteButton(
            isFavorite: widget.book.favorite,
            onTap: widget.book.favorite
                ? () => _removeFavoriteBookBloc.add(TriggerAnyAnimatedButtonEvent(widget.book))
                : () => _addFavoriteBookBloc.add(TriggerAnyAnimatedButtonEvent(widget.book)),
          ),
        ],
      ),
    );
  }
}

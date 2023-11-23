import 'package:any_animated_button/any_animated_button.dart';
import 'package:flutter/material.dart';
import 'package:my_books_to_read/core/style/colors.dart';

class FavoriteButton extends CustomAnyAnimatedButton {
  const FavoriteButton({
    required this.isFavorite,
    required this.onTap,
    this.bloc,
    this.width,
  });

  @override
  final AnyAnimatedButtonBloc? bloc;
  final bool isFavorite;
  final VoidCallback onTap;
  final double? width;

  @override
  AnyAnimatedButtonParams get defaultParams => AnyAnimatedButtonParams(
        width: width,
        height: 56.0,
        color: Colors.transparent,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                isFavorite ? Icons.star : Icons.star_border,
                color: CustomColors.red,
              ),
            ),
          ),
        ),
      );

  @override
  AnyAnimatedButtonParams get progressParams => AnyAnimatedButtonParams.progress(backgroundColor: Colors.transparent);
}

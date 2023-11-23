import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:my_books_to_read/core/error/failures.dart';
import 'package:my_books_to_read/core/style/colors.dart';
import 'package:my_books_to_read/core/style/dimens.dart';
import 'package:my_books_to_read/core/style/duration.dart';
import 'package:my_books_to_read/core/style/text_styles.dart';

abstract class Notifications {
  static void normal({
    required final String description,
    final Color backgroundColor = CustomColors.black,
  }) =>
      BotToast.showNotification(
        title: (final _) => Text(
          description,
          style: roboto.s16.colorWhite,
          textAlign: TextAlign.center,
          maxLines: 4,
          overflow: TextOverflow.ellipsis,
        ),
        backgroundColor: backgroundColor.withOpacity(0.8),
        contentPadding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 40.0),
        borderRadius: Dimens.buttonRadius,
      );

  static void error({
    required final Failure failure,
    final Color backgroundColor = CustomColors.black,
  }) =>
      normal(
        description: failure.errorMessage,
        backgroundColor: backgroundColor,
      );

  static void tappable({
    required final String description,
    final Color backgroundColor = CustomColors.black,
    final VoidCallback? onTap,
  }) =>
      BotToast.showNotification(
        title: (final _) => Text(
          description,
          style: roboto.s16.colorWhite,
          textAlign: TextAlign.center,
          maxLines: 4,
          overflow: TextOverflow.ellipsis,
        ),
        backgroundColor: backgroundColor.withOpacity(0.8),
        contentPadding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 40.0),
        borderRadius: Dimens.buttonRadius,
        onTap: onTap,
        duration: MyDurations.duration3s,
      );
}

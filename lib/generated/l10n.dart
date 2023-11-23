// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `There was an error`
  String get defaultError {
    return Intl.message(
      'There was an error',
      name: 'defaultError',
      desc: '',
      args: [],
    );
  }

  /// `today`
  String get today {
    return Intl.message(
      'today',
      name: 'today',
      desc: '',
      args: [],
    );
  }

  /// `yesterday`
  String get yesterday {
    return Intl.message(
      'yesterday',
      name: 'yesterday',
      desc: '',
      args: [],
    );
  }

  /// `tomorrow`
  String get tomorrow {
    return Intl.message(
      'tomorrow',
      name: 'tomorrow',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email`
  String get invalidEmail {
    return Intl.message(
      'Invalid email',
      name: 'invalidEmail',
      desc: '',
      args: [],
    );
  }

  /// `This field is necessary`
  String get thisFieldIsNecessary {
    return Intl.message(
      'This field is necessary',
      name: 'thisFieldIsNecessary',
      desc: '',
      args: [],
    );
  }

  /// `There was problem during searching books`
  String get searchBooksFailure {
    return Intl.message(
      'There was problem during searching books',
      name: 'searchBooksFailure',
      desc: '',
      args: [],
    );
  }

  /// `There was problem with adding to favorite`
  String get addFavoriteBookFailure {
    return Intl.message(
      'There was problem with adding to favorite',
      name: 'addFavoriteBookFailure',
      desc: '',
      args: [],
    );
  }

  /// `There was problem with retrieving favorite books `
  String get getFavoriteBooksFailure {
    return Intl.message(
      'There was problem with retrieving favorite books ',
      name: 'getFavoriteBooksFailure',
      desc: '',
      args: [],
    );
  }

  /// `There was problem with removing from favorite`
  String get removeFavoriteBookFailure {
    return Intl.message(
      'There was problem with removing from favorite',
      name: 'removeFavoriteBookFailure',
      desc: '',
      args: [],
    );
  }

  /// `No results`
  String get noResults {
    return Intl.message(
      'No results',
      name: 'noResults',
      desc: '',
      args: [],
    );
  }

  /// `Author Unknown`
  String get authorUnknown {
    return Intl.message(
      'Author Unknown',
      name: 'authorUnknown',
      desc: '',
      args: [],
    );
  }

  /// `Favorite Books`
  String get favoriteBooks {
    return Intl.message(
      'Favorite Books',
      name: 'favoriteBooks',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}

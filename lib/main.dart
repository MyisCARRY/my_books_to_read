import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:my_books_to_read/core/navigator/navigator.dart';
import 'package:my_books_to_read/features/books/presentation/screens/search_screen.dart';
import 'package:my_books_to_read/generated/l10n.dart';
import 'package:my_books_to_read/injection_container.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await InjectionContainer().init();
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(final BuildContext context) {
    return MaterialApp(
      onGenerateRoute: CustomNavigator.router.generator,
      navigatorKey: CustomNavigator.navigatorKey,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      title: 'My Books To Read',
      navigatorObservers: [BotToastNavigatorObserver()],
      builder: BotToastInit(),
      home: const SearchScreen(),
    );
  }
}

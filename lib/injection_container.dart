import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:my_books_to_read/app_config.dart';
import 'package:my_books_to_read/core/style/duration.dart';
import 'package:my_books_to_read/features/books/injection_container.dart';
import 'package:my_books_to_read/features/database/injection_container.dart';

final sl = GetIt.instance;

const globalDio = 'global';

class InjectionContainer extends Injector with BooksInjector, DatabaseInjector {}

abstract class Injector {
  @mustCallSuper
  Future<void> init() async {
    sl.registerSingleton<AppConfig>(AppConfig.init);
    sl.registerLazySingleton<Dio>(
      () {
        final dio = Dio(BaseOptions(
          baseUrl: sl<AppConfig>().api,
          connectTimeout: MyDurations.duration15s,
          receiveTimeout: MyDurations.duration15s,
        ));
        dio..options.headers = {"content-type": "application/json", "Accept": "application/json"};
        return dio;
      },
      instanceName: globalDio,
    );
  }
}

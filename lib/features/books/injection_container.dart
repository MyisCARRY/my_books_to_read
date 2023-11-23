import 'package:dio/dio.dart';
import 'package:my_books_to_read/features/books/data/datasources/books_datasource.dart';
import 'package:my_books_to_read/features/books/data/datasources/open_library_datasource.dart';
import 'package:my_books_to_read/features/books/data/repositories/books_repository.dart';
import 'package:my_books_to_read/features/books/domain/repositories/books_repository.dart';
import 'package:my_books_to_read/features/books/domain/usecases/search_books_usecase.dart';
import 'package:my_books_to_read/features/books/presentation/blocs/search_books_bloc/search_books_bloc.dart';
import 'package:my_books_to_read/features/books/presentation/blocs/search_books_type_cubit/search_books_type_cubit.dart';
import 'package:my_books_to_read/injection_container.dart';

mixin BooksInjector on Injector {
  @override
  Future<void> init() async {
    await super.init();

    final Dio dio = sl(instanceName: globalDio);

    // blocs
    sl.registerLazySingleton(() => SearchBooksBloc(searchBooksUsecase: sl()));
    sl.registerFactory(SearchBooksTypeCubit.new);

    // usecases
    sl.registerLazySingleton(() => SearchBooksUsecase(repository: sl()));

    // repositories
    sl.registerLazySingleton<BooksRepository>(() => BooksRepositoryImpl(datasource: sl()));

    // datasources
    sl.registerLazySingleton<BooksDatasource>(() => OpenLibraryDatasource(dio: dio));
  }
}

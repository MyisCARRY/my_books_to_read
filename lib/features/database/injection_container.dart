import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:my_books_to_read/features/database/data/datasources/database_datasource.dart';
import 'package:my_books_to_read/features/database/data/datasources/firestore_datasource.dart';
import 'package:my_books_to_read/features/database/data/repositories/database_repository.dart';
import 'package:my_books_to_read/features/database/domain/repositories/database_repository.dart';
import 'package:my_books_to_read/features/database/domain/usecases/add_favorite_book_usecase.dart';
import 'package:my_books_to_read/features/database/domain/usecases/get_favorite_books_usecase.dart';
import 'package:my_books_to_read/features/database/domain/usecases/remove_favorite_book_usecase.dart';
import 'package:my_books_to_read/features/database/presentation/blocs/add_favorite_book_bloc/add_favorite_book_bloc.dart';
import 'package:my_books_to_read/features/database/presentation/blocs/favorite_books_bloc/favorite_books_bloc.dart';
import 'package:my_books_to_read/features/database/presentation/blocs/remove_favorite_book_bloc/remove_favorite_book_bloc.dart';
import 'package:my_books_to_read/injection_container.dart';

mixin DatabaseInjector on Injector {
  @override
  Future<void> init() async {
    await super.init();

    final FirebaseFirestore client = FirebaseFirestore.instance;
    final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    // blocs
    sl.registerLazySingleton(() => FavoriteBooksBloc(getFavoriteBooksUsecase: sl()));
    sl.registerFactory(() => AddFavoriteBookBloc(addFavoriteBookUsecase: sl()));
    sl.registerFactory(() => RemoveFavoriteBookBloc(removeFavoriteBookUsecase: sl()));

    // usecases
    sl.registerLazySingleton(() => GetFavoriteBooksUsecase(repository: sl()));
    sl.registerLazySingleton(() => AddFavoriteBookUsecase(repository: sl()));
    sl.registerLazySingleton(() => RemoveFavoriteBookUsecase(repository: sl()));

    // repositories
    sl.registerLazySingleton<DatabaseRepository>(() => DatabaseRepositoryImpl(datasource: sl()));

    // datasources
    sl.registerLazySingleton<DatabaseDatasource>(() => FirestoreDatasource(
          client: client,
          deviceInfo: deviceInfo,
        ));
  }
}

import 'package:books_app/Core/Network/network_info.dart';
import 'package:books_app/Data/DataSources/book_local_data_source.dart';
import 'package:books_app/Data/DataSources/book_remote_data_source.dart';
import 'package:books_app/Data/Models/bookmodel.dart';
import 'package:books_app/Data/Repositories/book_repository_impl.dart';
import 'package:books_app/Domain/Repositiries/book_repository.dart';
import 'package:books_app/Domain/Usecases/book_usecase.dart';
import 'package:books_app/cubit/book_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

final GetIt sl = GetIt.instance;

Future<void> init() async {
  // **************** EXTERNAL PACKAGES ************************//
  final hive = await Hive.openBox<BookModel>("Book");
  sl.registerLazySingleton<Box>(() => hive);

  final sharedprefs = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => sharedprefs);

  sl.registerLazySingleton<http.Client>(() => http.Client());

  // *************************** CORES **************************//

  sl.registerLazySingleton<InternetConnectionChecker>(
    () => InternetConnectionChecker(),
  );

  //********************************************************* */

  sl.registerLazySingleton<BookLocalDataSource>(
    () => BookLocalDataSourceImpl(
      prefs: sl(),
      bookbox: sl(),
    ),
  );

  sl.registerLazySingleton<BookRemoteDataSource>(
    () => BookRemoteDataSourceImpl(
      client: sl(),
    ),
  );

  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(
      internetConnectionChecker: sl(),
    ),
  );

  sl.registerLazySingleton<BookRepository>(
    () => BookRepositoryImpl(
      bookLocalDataSourceImpl: sl(),
      bookRemoteDataSourceImpl: sl(),
      networkInfo: sl(),
    ),
  );

  sl.registerLazySingleton<GetBook>(
    () => GetBook(
      bookRepository: sl(),
    ),
  );

  sl.registerFactory(
    () => BookCubit(
      appBooks: sl(),
    ),
  );

  //final sharedprefs = await SharedPreferences.getInstance();
  // final bookRepo = BookRepositoryImpl(
  //   bookLocalDataSourceImpl: BookLocalDataSourceImpl(prefs: sharedprefs),
  //   bookRemoteDataSourceImpl: BookRemoteDataSourceImpl(client: http.Client()),
  //   networkInfo:
  //       NetworkInfoImpl(internetConnectionChecker: InternetConnectionChecker()),
  // );

  // final getBook = GetBook(bookRepository: bookRepo);

  // final cubit = BookCubit(appBooks: getBook);

  // return cubit;
}

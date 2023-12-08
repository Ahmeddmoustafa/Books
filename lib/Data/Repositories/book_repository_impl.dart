import 'package:books_app/Core/Errors/exceptions.dart';
import 'package:books_app/Core/Errors/failures.dart';
import 'package:books_app/Core/Network/network_info.dart';
import 'package:books_app/Data/DataSources/book_local_data_source.dart';
import 'package:books_app/Data/DataSources/book_remote_data_source.dart';
import 'package:books_app/Domain/Entities/book.dart';
import 'package:books_app/Domain/Repositiries/book_repository.dart';
import 'package:dartz/dartz.dart';

class BookRepositoryImpl implements BookRepository {
  final NetworkInfo networkInfo;
  final BookLocalDataSource bookLocalDataSourceImpl;
  final BookRemoteDataSource bookRemoteDataSourceImpl;

  BookRepositoryImpl(
      {required this.bookRemoteDataSourceImpl,
      required this.bookLocalDataSourceImpl,
      required this.networkInfo});
  @override
  Future<Either<Failure, List<Book>>> getBook() async {
    if (await networkInfo.isConnected) {
      try {
        final books = await bookRemoteDataSourceImpl.getBook();
        bookLocalDataSourceImpl.cacheBook(books);
        return Right(books);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final books = await bookLocalDataSourceImpl.getLastBook();
        return Right(books);
      } on CacheException {
        return Left(CachFailure());
      }
    }
  }
}

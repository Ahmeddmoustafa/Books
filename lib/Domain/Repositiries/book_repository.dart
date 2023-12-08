import 'package:books_app/Core/Errors/failures.dart';
import 'package:books_app/Domain/Entities/book.dart';
import 'package:dartz/dartz.dart';

abstract class BookRepository {
  Future<Either<Failure, List<Book>>> getBook();
}

import 'package:books_app/Core/Errors/failures.dart';
import 'package:books_app/Domain/Repositiries/book_repository.dart';
import 'package:books_app/Domain/Usecases/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:books_app/Domain/Entities/book.dart';

class GetBook implements UseCase<List<Book>, NoParams> {
  final BookRepository bookRepository;

  GetBook({required this.bookRepository});

  @override
  Future<Either<Failure, List<Book>>> call(NoParams params) =>
      bookRepository.getBook();
}

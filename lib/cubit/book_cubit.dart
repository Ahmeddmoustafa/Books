import 'package:bloc/bloc.dart';
import 'package:books_app/Core/Errors/failures.dart';
import 'package:books_app/Domain/Entities/book.dart';
import 'package:books_app/Domain/Usecases/book_usecase.dart';
import 'package:books_app/Domain/Usecases/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'book_state.dart';

class BookCubit extends Cubit<BookState> {
  final GetBook appBooks;
  List<Book> booksloaded = [];
  BookCubit({required this.appBooks}) : super(BookInitial());

  Future<void> loadBooks() async {
    emit(BookInitial());
    final books = await appBooks(NoParams());

    emit(books.fold(
      (failure) => BookIsFailed(
        msg: _mapFailureToString(failure),
      ),
      (bookResponse) {
        booksloaded = bookResponse;
        return BookLoaded(appBooks: bookResponse);
      },
    ));
  }

  Future<void> selectBook(int index) {
    print(booksloaded[index]);
    if (index >= 0) {
      emit(
        BookSelected(book: booksloaded[index], appBooks: booksloaded),
      );
    }
    return Future.value();
  }

  String _mapFailureToString(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return "SERVER_FAILURE";

      case CachFailure:
        return "CACHE_FAILUR";

      default:
        return "UNEXPECTED_ERROR";
    }
  }
}

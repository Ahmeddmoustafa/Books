part of 'book_cubit.dart';

sealed class BookState extends Equatable {
  const BookState();

  @override
  List<Object> get props => [];
}

final class BookInitial extends BookState {}

final class BookIsLoading extends BookState {}

final class BookIsFailed extends BookState {
  final String msg;

  const BookIsFailed({required this.msg});
}

final class BookLoaded extends BookState {
  final List<Book> appBooks;

  const BookLoaded({required this.appBooks});
}

final class BookSelected extends BookState {
  final Book book;
  final List<Book> appBooks;

  const BookSelected({required this.appBooks, required this.book});
}

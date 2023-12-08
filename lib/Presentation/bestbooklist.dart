import 'package:books_app/Presentation/bestbook.dart';
import 'package:books_app/cubit/book_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookList extends StatefulWidget {
  const BookList({super.key});

  @override
  State<BookList> createState() => _BookListState();
}

class _BookListState extends State<BookList> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BookCubit, BookState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is BookLoaded) {
          return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: state.appBooks.length,
              itemBuilder: (context, index) {
                return BestBook(
                  book: state.appBooks[index],
                );
              });
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}

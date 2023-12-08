import 'package:books_app/Presentation/bookbutton.dart';
import 'package:books_app/Presentation/bookimage.dart';
import 'package:books_app/Presentation/likedbooks.dart';
import 'package:books_app/Presentation/searchbar.dart';
import 'package:books_app/Resources/colors_manager.dart';
import 'package:books_app/Resources/values_manager.dart';
import 'package:books_app/cubit/book_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookPage extends StatefulWidget {
  const BookPage({super.key});

  @override
  State<BookPage> createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<BookCubit, BookState>(builder: (context, state) {
        print(state.runtimeType);
        if (state is BookSelected) {
          return Container(
            padding: const EdgeInsets.all(AppSize.s14),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                const BookSearchBar(),
                BookImage(
                  image: state.book.image,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      state.book.name,
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    Text(state.book.writer,
                        style: Theme.of(context).textTheme.displaySmall),
                  ],
                ),
                Text(
                  state.book.rating,
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                const BookButton(),
                Text(
                  "You can also like",
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                LikedBooks(books: state.appBooks)
              ],
            ),
          );
        } else {
          return const CircularProgressIndicator();
        }
      }),
    );
  }
}

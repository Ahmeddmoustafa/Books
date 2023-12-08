import 'package:books_app/Presentation/bestbook.dart';
import 'package:books_app/Presentation/bestbooklist.dart';
import 'package:books_app/Presentation/bookcard.dart';
import 'package:books_app/Presentation/searchbar.dart';
import 'package:books_app/Resources/values_manager.dart';
import 'package:books_app/cubit/book_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    BlocProvider.of<BookCubit>(context).loadBooks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: AppSize.s10),
          child: Column(
            children: <Widget>[
              const BookSearchBar(),
              const BookCard(),
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: AppMargin.m14),
                    child: Text(
                      "Best Seller",
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                  ),
                ],
              ),
              const BookList()
            ],
          ),
        ),
      ),
    );
  }
}

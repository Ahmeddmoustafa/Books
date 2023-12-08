import 'package:books_app/Domain/Entities/book.dart';
import 'package:books_app/Resources/colors_manager.dart';
import 'package:books_app/Resources/values_manager.dart';
import 'package:flutter/material.dart';

class LikedBooks extends StatefulWidget {
  final List<Book> books;
  const LikedBooks({super.key, required this.books});

  @override
  State<LikedBooks> createState() => _LikedBooksState();
}

class _LikedBooksState extends State<LikedBooks> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.13,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.books.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(right: AppMargin.m8),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.15,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(widget.books[index].image),
                ),
                color: ColorManager.White,
                borderRadius: BorderRadius.circular(AppSize.s10),
              ),
            ),
          );
        },
      ),
    );
  }
}

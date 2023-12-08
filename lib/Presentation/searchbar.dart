import 'package:books_app/Resources/colors_manager.dart';
import 'package:books_app/Resources/routes_manager.dart';
import 'package:books_app/Resources/values_manager.dart';
import 'package:flutter/material.dart';

class BookSearchBar extends StatefulWidget {
  const BookSearchBar({super.key});

  @override
  State<BookSearchBar> createState() => _BookSearchBarState();
}

class _BookSearchBarState extends State<BookSearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: AppSize.s10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () =>
                Navigator.pushReplacementNamed(context, Routes.homeRoute),
            child: Text(
              "BOOKLY",
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ),
          Icon(
            Icons.search,
            color: ColorManager.White,
          ),
        ],
      ),
    );
  }
}

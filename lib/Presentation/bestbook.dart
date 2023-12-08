import 'package:books_app/Domain/Entities/book.dart';
import 'package:books_app/Presentation/bookdetails.dart';
import 'package:books_app/Resources/colors_manager.dart';
import 'package:books_app/Resources/values_manager.dart';
import 'package:flutter/material.dart';

class BestBook extends StatefulWidget {
  final Book book;
  const BestBook({super.key, required this.book});

  @override
  State<BestBook> createState() => _BestBookState();
}

class _BestBookState extends State<BestBook> {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: AppSize.s100),
      child: Container(
        margin: const EdgeInsets.only(bottom: AppMargin.m14),
        width: MediaQuery.of(context).size.width,
        height: AppSize.s100,
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(widget.book.image),
                  ),
                  borderRadius: BorderRadius.circular(AppSize.s10),
                  color: ColorManager.Black,
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: BookDetails(
                book: widget.book,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

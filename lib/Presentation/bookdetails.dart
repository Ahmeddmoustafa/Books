import 'package:books_app/Domain/Entities/book.dart';
import 'package:books_app/Resources/colors_manager.dart';
import 'package:books_app/Resources/values_manager.dart';
import 'package:flutter/material.dart';

class BookDetails extends StatefulWidget {
  final Book book;
  const BookDetails({super.key, required this.book});

  @override
  State<BookDetails> createState() => _BookDetailsState();
}

class _BookDetailsState extends State<BookDetails> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.p30,
        vertical: AppPadding.p10,
      ),
      // color: ColorManager.DarkGrey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            widget.book.name,
            style: Theme.of(context).textTheme.displayLarge,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            widget.book.writer,
            style: Theme.of(context).textTheme.displaySmall,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.book.price,
                style: Theme.of(context).textTheme.displayLarge,
              ),
              Text(
                widget.book.rating,
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

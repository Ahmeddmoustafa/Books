import 'package:books_app/Resources/colors_manager.dart';
import 'package:books_app/Resources/values_manager.dart';
import 'package:flutter/material.dart';

class BookImage extends StatefulWidget {
  final String image;
  const BookImage({super.key, required this.image});

  @override
  State<BookImage> createState() => _BookImageState();
}

class _BookImageState extends State<BookImage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.35,
      height: MediaQuery.of(context).size.height * 0.3,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: NetworkImage(widget.image),
        ),
        color: ColorManager.White,
        borderRadius: BorderRadius.circular(AppSize.s14),
      ),
    );
    ;
  }
}

import 'package:books_app/Resources/colors_manager.dart';
import 'package:flutter/material.dart';

class BookButton extends StatefulWidget {
  const BookButton({super.key});

  @override
  State<BookButton> createState() => _BookButtonState();
}

class _BookButtonState extends State<BookButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.75,
      height: MediaQuery.of(context).size.height * 0.07,
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: ColorManager.White,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20), // Top left edge
                  bottomLeft: Radius.circular(20), // Bottom left edge
                ),
              ),
              child: Center(
                child: Text(
                  "19.99 E",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: ColorManager.PrimaryColor,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(20), // Top left edge
                  bottomRight: Radius.circular(20), // Bottom left edge
                ),
              ),
              child: Center(
                child: Text(
                  "Free preview",
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

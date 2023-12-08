import 'package:equatable/equatable.dart';

abstract class Book extends Equatable {
  final String name;
  final String writer;
  final String price;
  final String rating;
  final String image;

  const Book(
      {required this.name,
      required this.writer,
      required this.price,
      required this.image,
      required this.rating});

  @override
  List get props => [name, writer, price, rating, image];
}

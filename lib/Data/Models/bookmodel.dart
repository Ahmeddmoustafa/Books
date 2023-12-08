// ignore_for_file: annotate_overrides, overridden_fields

import 'package:books_app/Domain/Entities/book.dart';
import 'package:hive/hive.dart';

part 'bookmodel.g.dart';

@HiveType(typeId: 2)
class BookModel extends Book {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String writer;
  @HiveField(2)
  final String price;
  @HiveField(3)
  final String rating;
  @HiveField(4)
  final String image;

  const BookModel({
    required this.name,
    required this.writer,
    required this.price,
    required this.rating,
    required this.image,
  }) : super(
            name: name,
            writer: writer,
            price: price,
            rating: rating,
            image: image);

  factory BookModel.fromJson(Map<String, dynamic> json) => BookModel(
        name: json["name"],
        writer: json["writer"],
        price: json["price"],
        rating: json["rating"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "writer": writer,
        "price": price,
        "rating": rating,
        "image": image
      };
}

import 'dart:convert';

import 'package:books_app/Core/Errors/exceptions.dart';
import 'package:books_app/Data/Models/bookmodel.dart';
import 'package:books_app/Domain/Entities/book.dart';
import 'package:http/http.dart' as http;

abstract class BookRemoteDataSource {
  Future<List<Book>> getBook();
}

class BookRemoteDataSourceImpl implements BookRemoteDataSource {
  final http.Client client;

  BookRemoteDataSourceImpl({required this.client});
  @override
  Future<List<Book>> getBook() async {
    Uri uri = Uri.parse("https://ahmed98.wiremockapi.cloud/book");
    final response = await client.get(uri);
    if (response.statusCode == 200) {
      final jsonString = response.body;
      // print(jsonDecode(jsonString)[0]);
      final List decodedJson = jsonDecode(jsonString);
      List<Book> books = [];
      for (int i = 0; i < decodedJson.length; i++) {
        books.add(BookModel.fromJson(decodedJson[i]));
      }
      return books;
    } else {
      throw ServerException();
    }
  }
}

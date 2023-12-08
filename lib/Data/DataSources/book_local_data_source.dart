import 'dart:convert';

import 'package:books_app/Core/Errors/exceptions.dart';
import 'package:books_app/Data/Models/bookmodel.dart';
import 'package:books_app/Domain/Entities/book.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class BookLocalDataSource {
  Future<void> cacheBook(List<Book> book);

  Future<List<Book>> getLastBook();
}

class BookLocalDataSourceImpl implements BookLocalDataSource {
  final Box bookbox;
  final SharedPreferences prefs;

  const BookLocalDataSourceImpl({required this.bookbox, required this.prefs});

  @override
  Future<void> cacheBook(List<Book> book) {
    prefs.setString("GET_LAST_BOOK", jsonEncode(book));

    return Future.value();
  }

  @override
  Future<List<Book>> getLastBook() async {
    String? jsonString = prefs.getString("GET_LAST_BOOK");
    if (jsonString != null) {
      List<Book> books = [];
      for (int i = 0; i < 1; i++) {
        books.add(BookModel.fromJson(jsonDecode(jsonString[i])));
      }
      return Future.value(books);
    } else {
      throw CacheException();
    }
  }
}

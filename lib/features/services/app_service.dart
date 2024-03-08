import 'package:book_finder/features/model/books.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
class AppService extends GetxService {

   Database? database;
  RxList<BookModel> books = RxList<BookModel>([]);

   Future<void> initDatabase() async {
     database = await openDatabase(
       join(await getDatabasesPath(), 'myBooks.db'),
       version: 1,
       onCreate: (db, version) async {
         await db.execute('''
          CREATE TABLE books (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            bookName TEXT,
            bookAuthor TEXT,
            bookCell INTEGER
          )
        ''');
      },
    );
    await _loadBooks();
  }

  Future<void> _loadBooks() async {
    final rawData = await database!.rawQuery('SELECT * FROM books');
    books.clear();
    books.addAll(rawData.map((json) => BookModel.fromJson(json)));
  }

  Future<List<BookModel>> getBooks() async {
    final rawData = await database!.rawQuery('SELECT * FROM books');
    return rawData.map((json) => BookModel.fromJson(json)).toList();
  }

  Future<bool> saveBook(BookModel book) async {
    try {
      await database!.insert('books', book.toJson());
      await _loadBooks();
      return true;
    } catch (error) {
      print('Error saving book: $error');
      return false;
    }
  }

  Future<void> deleteBook(int id) async {
    await database!.delete('books', where: 'id = ?', whereArgs: [id]);
    await _loadBooks();
  }

  Future<void> updateBook(BookModel book,int id) async {
    await database!.update('books', book.toJson(),
        where: 'id = ?', whereArgs: [id]);
    await _loadBooks();
  }

  Future<List<BookModel>> searchBooksByName(String name) async {
    final rawData = await database!.rawQuery(
        'SELECT * FROM books WHERE bookName LIKE ?', ['%$name%']);
    return rawData.map((json) => BookModel.fromJson(json)).toList();
  }
}

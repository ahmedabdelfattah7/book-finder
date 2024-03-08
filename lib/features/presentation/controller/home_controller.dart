import 'dart:ffi';

import 'package:book_finder/config/routes/app_pages.dart';
import 'package:book_finder/core/colors.dart';
import 'package:book_finder/features/model/books.dart';
import 'package:book_finder/features/services/app_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends SuperController<bool> {
  final AppService appService = Get.find<AppService>();
  final TextEditingController bookNameController = TextEditingController();
  final TextEditingController searchController = TextEditingController();
  final TextEditingController bookAuthorNameController =
      TextEditingController();
  final TextEditingController bookCellNumberController =
      TextEditingController();
  RxList<BookModel> books = RxList<BookModel>([]);
  @override
  void onInit() async {
    super.onInit();
    books.bindStream(appService.books.stream);
    await appService.initDatabase();
  }

  Future<void> getBooks() async {
    books.value = await appService.getBooks();
  }

  Future<void> saveBook(BookModel book) async {
    bool success = await appService.saveBook(book);
    if (success) {
      await getBooks();
      Get.toNamed(Routes.HOME);
      bookNameController.clear();
      bookCellNumberController.clear();
      bookAuthorNameController.clear();
      Get.snackbar(
        'Success!',
        'Data saved successfully',
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        maxWidth: 300,
        backgroundColor: ColorCode.titleblack,
        margin: const EdgeInsets.all(16.0),
        icon: const Icon(Icons.check_circle, color: Colors.white),
        shouldIconPulse: true,
        duration: const Duration(seconds: 3),
      );
    } else {
      Get.snackbar(
        'Error!',
        'Failed to save data',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        margin: const EdgeInsets.all(16.0),
        icon: const Icon(Icons.error, color: Colors.white),
        shouldIconPulse: true,
        duration: const Duration(seconds: 3),
      );
    }
  }

  Future<void> deleteBook(int id) async {
    try {
      await appService.deleteBook(id);
      Get.snackbar(
        'Success!'.tr,
        'Data deleted successfully'.tr,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        maxWidth: 300,
        backgroundColor: ColorCode.titleblack,
        margin: const EdgeInsets.all(16.0),
        icon: const Icon(Icons.check_circle, color: Colors.white),
        shouldIconPulse: true,
        duration: const Duration(seconds: 3),
      );
      getBooks();
      debugPrint('data deleted successfully$id');
    } catch (e) {
      Get.snackbar(
        'Error'.tr,
        'Failed to delete document'.tr,
        snackPosition: SnackPosition.BOTTOM,
        maxWidth: 300,
        backgroundColor: Colors.red,
        margin: const EdgeInsets.all(16.0),
        icon: const Icon(Icons.error, color: Colors.white),
        shouldIconPulse: true,
        duration: const Duration(seconds: 3),
      );
      debugPrint('Error deleting drug: $e');
    }
  }
  List<Color> colorList = [
    const Color(0xff0097A7),
    const Color(0xffFF5252),
    const Color(0xff4CAF50),
    const Color(0xffFF9800),
  ];
  Future<void> updateBook(BookModel book,int id) async {
    await appService.updateBook(book,id);
  }

  final RxList<BookModel> searchedBooks = <BookModel>[].obs;

  Future<void> searchBooksByName(String name) async {
    if (name.isEmpty) {
      searchedBooks.clear();
    } else {
      final results = await appService.searchBooksByName(name);
      searchedBooks.assignAll(results);

    }
  }

  @override
  void onDetached() {
    // TODO: implement onDetached
  }

  @override
  void onHidden() {
    // TODO: implement onHidden
  }

  @override
  void onInactive() {
    // TODO: implement onInactive
  }

  @override
  void onPaused() {
    // TODO: implement onPaused
  }

  @override
  void onResumed() {
    // TODO: implement onResumed
  }
}

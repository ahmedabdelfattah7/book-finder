import 'package:book_finder/config/routes/app_pages.dart';
import 'package:book_finder/features/presentation/add_book_page.dart';
import 'package:book_finder/features/presentation/home.dart';
import 'package:book_finder/features/presentation/search.dart';

import 'package:get/get.dart';

import '../../features/bindings/bindings.dart';

class AppPages{

  static final routes =[
    GetPage(
        name: Routes.HOME,
        page: () =>  HomeScreen(),
        binding: HomeBinding()),

    GetPage(
        name: Routes.INPUTPAGE,
        page: () =>  AddBookPage(),
        binding: HomeBinding()),

    GetPage(
        name: Routes.SEARCH,
        page: () =>  SearchPage(),
        binding: HomeBinding()),
  ];
}
import 'package:book_finder/config/routes/app_pages.dart';
import 'package:book_finder/config/routes/app_routes.dart';
import 'package:book_finder/config/themes/themes.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BookFinder extends StatelessWidget {
  const BookFinder({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 923),
      minTextAdapt: true,
      splitScreenMode: true,useInheritedMediaQuery :true,

    builder: (BuildContext context, child) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        enableLog: true,
        theme: Themes.light,
        getPages: AppPages.routes,
        initialRoute: Routes.HOME,
      );
    }
    );
  }
}

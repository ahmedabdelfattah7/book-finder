import 'package:book_finder/config/routes/app_pages.dart';
import 'package:book_finder/core/colors.dart';
import 'package:book_finder/core/gaps.dart';
import 'package:book_finder/core/styles.dart';
import 'package:book_finder/features/presentation/controller/home_controller.dart';
import 'package:book_finder/features/presentation/widgets/book_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          FontAwesomeIcons.bookBookmark,
          color: ColorCode.secondary,
          size: 25,
        ),
        title: Text(
          'Book Finder',
          style: TextStyles.textMedium.copyWith(
            color: ColorCode.primary,
            fontWeight: FontWeight.w600,
            fontSize: 21,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(Routes.SEARCH);
            },
            icon: const Icon(
              Icons.search,
              color: ColorCode.primary,
              size: 30,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Your library',
            style: TextStyles.textMedium.copyWith(
              color: ColorCode.primary,
              fontWeight: FontWeight.w600,
              fontSize: 21,
            ),
          ),
          Gaps.vGap12,
          Obx(() => Expanded(
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) {
                    final item = controller.books[index];
                    return BookWidget(
                      item: item,
                      index: index,
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 20.h,
                    );
                  },
                  itemCount: controller.books.length,
                ),
              )),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorCode.secondary,
        onPressed: () {
          Get.toNamed(Routes.INPUTPAGE);
        },
        shape: const CircleBorder(),
        child: const Icon(
          Icons.add,
          size: 15,
          color: Colors.white,
        ),
      ),
    );
  }
}

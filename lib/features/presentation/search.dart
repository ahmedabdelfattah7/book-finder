import 'package:book_finder/core/colors.dart';
import 'package:book_finder/core/gaps.dart';
import 'package:book_finder/core/styles.dart';
import 'package:book_finder/core/widgets/custom_text_form_field.dart';
import 'package:book_finder/features/presentation/controller/home_controller.dart';
import 'package:book_finder/features/presentation/widgets/book_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SearchPage extends GetView<HomeController> {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(

        title: Text(
          'Book Finder',
          style: TextStyles.textMedium.copyWith(
            color: ColorCode.primary,
            fontWeight: FontWeight.w600,
            fontSize: 21,
          ),
        ),
      ),
      body:  Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(
              height: 50.sp,
              child: CustomTextFormField(
                controller: controller.searchController,
                onSave: (value) {},
                onChange: (value) {
                  controller.searchBooksByName(value!);
                },
                validator: (String? val) {
                  if (val == null || val.isEmpty) {
                    return null;
                  } else {
                    return null;
                  }
                },
                hint: 'search',
                prefixIcon: const Icon(
                  Icons.search,
                ),
                inputType: TextInputType.text,
                filledColor: ColorCode.shadowGrey3,
              ),
            ),
            Gaps.vGap10,
            Obx(() => ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                final item = controller.searchedBooks[index];
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
              itemCount: controller.searchedBooks.length,
            )),
          ],
        ),
      ),
    );
  }
}

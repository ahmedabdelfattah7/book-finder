import 'package:book_finder/config/routes/app_pages.dart';
import 'package:book_finder/core/colors.dart';
import 'package:book_finder/core/gaps.dart';
import 'package:book_finder/core/styles.dart';
import 'package:book_finder/core/svg_asset_manger.dart';
import 'package:book_finder/core/widgets/custom_text_form_field.dart';
import 'package:book_finder/features/presentation/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
class BookInfo extends  GetView<HomeController>  {
  const BookInfo({
    super.key,required this.item,
  });
final item;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
      AppSVGAssets.getWidget(AppSVGAssets.book,
        width: 40.w, height: 30.h, fit: BoxFit.cover,),
              Gaps.hGap8,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Book name',
                    style: TextStyles.textXSmall.copyWith(
                      color: ColorCode.titleGrey2,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    item.bookName,
                    style: TextStyles.textSmall.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),


            ],
          ),
          Gaps.vGap12,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AppSVGAssets.getWidget(AppSVGAssets.avatar,
                width: 40.w, height: 40.h, fit: BoxFit.cover,),
              Gaps.hGap8,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Created by',
                    style: TextStyles.textXSmall.copyWith(
                      color: ColorCode.titleGrey2,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    item.bookAuthor,
                    style: TextStyles.textXSmall.copyWith(
                      color: ColorCode.titleblack2,
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
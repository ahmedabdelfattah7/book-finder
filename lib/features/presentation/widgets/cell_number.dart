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

class CellNumberWidget extends  GetView<HomeController>  {
  const CellNumberWidget({
    super.key,required this.item,required this.color
  });
final item;
final Color color;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 19,
          width: 6,
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(5)),
        ),
        Gaps.hGap8,
        Row(
          children: [
            Text(
              'Cell No',
              style: TextStyles.textXSmall,
            ),
            Gaps.hGap8,
            Text(
              '${item.bookCell}',
              style: TextStyles.textXSmall,
            ),
          ],
        ),
      ],
    );
  }
}
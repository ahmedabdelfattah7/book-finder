import 'package:book_finder/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextStyles {
  static TextStyle textXLarge = TextStyle(
    fontSize: 40.sp,
    color: ColorCode.titleblack,
    fontWeight: FontWeight.bold,
    height: 1.2,
    fontFamily: 'Poppins',
  );
  static TextStyle textLarge = TextStyle(
    fontSize: 20.sp,
    color: ColorCode.titleblack,
    fontWeight: FontWeight.w700,
    height: 1.2,
    fontFamily: 'Poppins',
  );

  static const TextStyle textMedium = TextStyle(
    fontSize: 18,
    color: ColorCode.titleblack,
    fontWeight: FontWeight.w700,
    height: 1.2,
    fontFamily: 'Poppins',
  );
  static  TextStyle textMedium2 = TextStyle(
    fontSize: 16.sp,
    color: ColorCode.titleblack,
    fontWeight: FontWeight.w700,
    height: 1.2,
    fontFamily: 'Poppins',
  );
  static TextStyle textSmall = TextStyle(
    fontSize: 14.sp,
    height: 1,
    color: ColorCode.titleblack,
    fontWeight: FontWeight.w700,
    fontFamily: 'Poppins',
  );
  static TextStyle textXSmall = TextStyle(
    fontSize: 12.sp,
    color: ColorCode.titleblack,
    fontWeight: FontWeight.w500,
    fontFamily: 'Poppins',
  );
}
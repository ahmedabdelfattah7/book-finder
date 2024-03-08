import 'package:book_finder/core/colors.dart';
import 'package:book_finder/core/gaps.dart';
import 'package:book_finder/features/presentation/controller/home_controller.dart';
import 'package:book_finder/features/presentation/home.dart';
import 'package:book_finder/features/presentation/widgets/book_info.dart';
import 'package:book_finder/features/presentation/widgets/cell_number.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class BookItem extends  GetView<HomeController>  {
  const BookItem({
    super.key,required this.item,required this.color
  });
final  item ;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(

      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CellNumberWidget(item: item, color: color,),
            Gaps.hGap12,
            const VerticalDivider(
              thickness: 2,
              color: ColorCode.dividerColorGrey3,
            ),
            Gaps.hGap12,
            BookInfo(item: item,),
          ],
        ),
      ),
    );
  }
}
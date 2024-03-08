import 'package:book_finder/core/colors.dart';
import 'package:book_finder/features/model/books.dart';
import 'package:book_finder/features/presentation/controller/home_controller.dart';
import 'package:book_finder/features/presentation/widgets/book_item.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class BookWidget extends GetView<HomeController> {
  const BookWidget({
    super.key,
    required this.item,
    required this.index,
  });

  final int index;
  final BookModel item;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      direction: DismissDirection.endToStart,
      background: Container(
        decoration: BoxDecoration(
          color: ColorCode.primary,
          borderRadius: BorderRadius.circular(15),
        ),
        width: double.infinity,
        child: const Center(
          child: Padding(
            padding: EdgeInsetsDirectional.only(start: 180),
            child: Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
        ),
      ),
      confirmDismiss: (direction) => showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('Please Confirm'.tr),
          content: Text('Are you sure you want to delete?'.tr),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(ctx).pop(false);
              },
              child: Text('Cancel'.tr),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              onPressed: () {
                Navigator.of(ctx).pop(true);
              },
              child: const Text('Confirm',style: TextStyle(color: Colors.white),),
            ),
          ],
        ),
      ),
      onDismissed: (DismissDirection direction) {
        if (direction == DismissDirection.endToStart) {
          controller.deleteBook(item.id!);
          controller.books.remove(item);
        }
      },
      key: UniqueKey(),
      child: InkWell(
        onTap: () {},
        child: BookItem(
          item: item,
          color: controller.colorList[index % controller.colorList.length],
        ),
      ),
    );
  }
}
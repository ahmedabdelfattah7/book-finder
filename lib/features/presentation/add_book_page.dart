import 'package:book_finder/core/colors.dart';
import 'package:book_finder/core/custom_button.dart';
import 'package:book_finder/core/gaps.dart';
import 'package:book_finder/core/styles.dart';
import 'package:book_finder/core/widgets/custom_text_form_field.dart';
import 'package:book_finder/features/model/books.dart';
import 'package:book_finder/features/presentation/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

class AddBookPage extends GetView<HomeController> {
  AddBookPage({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.focusScope?.unfocus(),
      child: Scaffold(
        appBar: AppBar(),
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22.5, vertical: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Add Your Book ',
                  style: TextStyles.textMedium,
                ),
                Gaps.vGap12,
                SizedBox(
                  height: 50,
                  child: CustomTextFormField(
                    controller: controller.bookNameController,
                    onSave: (value) {},
                    validator: (String? val) {
                      if (val == null || val.isEmpty) {
                        return 'please input the book name';
                      } else {
                        return null;
                      }
                    },
                    hint: 'Book Name',
                    prefixIcon: const Icon(FontAwesomeIcons.book),
                    inputType: TextInputType.text,
                    filledColor: ColorCode.white,
                  ),
                ),
                Gaps.vGap12,
                SizedBox(
                  height: 50,
                  child: CustomTextFormField(
                    controller: controller.bookAuthorNameController,
                    onSave: (value) {},
                    validator: (String? val) {
                      if (val == null || val.isEmpty) {
                        return 'please input the book author name';
                      } else {
                        return null;
                      }
                    },
                    hint: 'Author Name',
                    prefixIcon: const Icon(FontAwesomeIcons.circleUser),
                    inputType: TextInputType.text,
                    filledColor: ColorCode.white,
                  ),
                ),
                Gaps.vGap12,
                SizedBox(
                  height: 50,
                  child: CustomTextFormField(
                    controller: controller.bookCellNumberController,
                    onSave: (value) {},
                    validator: (String? val) {
                      if (val == null || val.isEmpty) {
                        return 'please input the book cell number';
                      } else {
                        return null;
                      }
                    },
                    hint: 'Cell Number',
                    prefixIcon: const Icon(FontAwesomeIcons.arrowDown19),
                    inputType: TextInputType.number,
                    filledColor: ColorCode.white,
                  ),
                ),
                Gaps.vGap20,
                CustomButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      controller.saveBook(BookModel(
                        bookName: controller.bookNameController.text,
                        bookAuthor: controller.bookAuthorNameController.text,
                        bookCell: int.tryParse(
                                controller.bookCellNumberController.text) ??
                            0,
                      ));
                    }
                  },
                  child: Center(
                    child: Text('Save',
                        style: TextStyles.textMedium.copyWith(
                          color: ColorCode.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

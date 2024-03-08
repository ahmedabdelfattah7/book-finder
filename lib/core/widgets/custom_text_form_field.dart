import 'package:book_finder/core/colors.dart';
import 'package:book_finder/core/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  final TextInputType inputType;
  final bool obscureText;
  TextEditingController? controller;
  final bool isHiddenPassword;
  final String obscuringCharacter;
  final String hint;
  // final String label;
  final Color? filledColor;
  bool enable;
  final Function()? onTap;

  final InputDecoration? decoration;
  final Function(String?)? onSave;
  final Function(String?)? onChange;
  final Function(String?)? nextFocus;
  final Function()? onTapShowHidePassword;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  TextInputAction? textInputAction;
  int maxLines;
  int? maxLength;
  Widget? suffixIcon;
  Widget? prefixIcon;
  List<TextInputFormatter>? inputFormatters;
  final TextStyle? labelTextStyle;
  final TextAlignVertical textAlignVertical;
  CustomTextFormField(
      {Key? key,
        required this.hint,
        this.onSave,
        required this.inputType,
        // required this.label,
        this.textAlignVertical = TextAlignVertical.center,
        this.onChange,
        this.nextFocus,
        this.validator,
        this.controller,
        this.obscureText = false,
        this.filledColor,
        this.maxLength,
        this.decoration,
        this.focusNode,
        this.maxLines = 1,
        this.isHiddenPassword = false,
        this.obscuringCharacter = "*",
        this.inputFormatters,
        this.enable = true,
        this.onTap,
        this.onTapShowHidePassword,
        this.textInputAction,
        this.suffixIcon,
        this.prefixIcon,
        this.labelTextStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(

      controller: controller,
      validator: validator,
      onSaved: onSave,
      onChanged: onChange,
      cursorColor: ColorCode.darkGrey,
      showCursor: true,
      onTap: onTap,
      enabled: enable,
      textAlign: TextAlign.start,
      keyboardType: inputType,
      maxLines: maxLines,
      minLines: maxLines >= 1 ? maxLines : 1,
      focusNode: focusNode,
      inputFormatters: inputFormatters ?? [],
      textAlignVertical: textAlignVertical,
      autovalidateMode: AutovalidateMode.onUserInteraction  ,

      obscureText: obscureText && isHiddenPassword,
      obscuringCharacter: obscuringCharacter,
      textInputAction: textInputAction,
      onFieldSubmitted: nextFocus,
      maxLength: maxLength,
      style: TextStyles.textMedium.copyWith(
        color: ColorCode.darkGrey,
        fontWeight: FontWeight.w500,
        fontSize: 14,
      ),
      decoration: decoration ??
          InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.never,
            hintText: hint,
            hintStyle: TextStyles.textMedium.copyWith(
              color: ColorCode.lightGrey2,
              fontWeight: FontWeight.w500,
              fontSize: 13,
            ),
            labelText: hint,
            errorStyle: TextStyles.textMedium.copyWith(fontSize:14,color: ColorCode.red,fontWeight: FontWeight.w400),
            errorText: validator!=null ? null : validator!(controller?.text) ??"",
            labelStyle: labelTextStyle ??
                TextStyles.textXSmall.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                    color: ColorCode.lightGrey2),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.r)),
              borderSide: BorderSide(
                  color: filledColor != null
                      ? filledColor!
                      : ColorCode.lightGrey,
                  width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.r)),
              borderSide: BorderSide(
                  color: filledColor != null
                      ? filledColor!
                      : ColorCode.lightGrey,
                  width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.r)),
              borderSide: BorderSide(
                  color: filledColor != null
                      ? filledColor!
                      : ColorCode.lightGrey,
                  width: 1),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.r)),
              borderSide:
              BorderSide(color: ColorCode.red, width: 1),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.r)),
              borderSide:
              BorderSide(color: ColorCode.red, width: 1),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.r)),
              borderSide: BorderSide(
                  color: filledColor != null
                      ? filledColor!
                      : ColorCode.lightGrey,
                  width: 1),
            ),
            fillColor: filledColor ?? ColorCode.white,
            filled: true,

            contentPadding:
            EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h).r,
            prefixIcon: prefixIcon,
            suffixIcon:  suffixIcon,
          ),
    );
  }
}

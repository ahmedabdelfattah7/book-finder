
import 'package:book_finder/core/colors.dart';
import 'package:flutter/material.dart';



class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    this.elevation = 20,
    this.borderRadius = 8,
    required this.child,
    this.backGroundColor = (ColorCode.primary),
    this.shadowColor = (ColorCode.shadowColorGrey),
    this.height = 50,
    this.width,
  });
  final VoidCallback? onPressed;
  final double elevation;
  final double borderRadius;
  final Widget child;
  final Color backGroundColor;
  final Color shadowColor;
  final double height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Card(
        shadowColor: shadowColor,
        elevation: elevation,
        child: Container(
          height: height,
          width: width ?? double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            color: backGroundColor,
          ),
          child: child,
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class AppSVGAssets {

  static const avatar = "assets/svg_icons/avatar.svg";

  static const book = "assets/svg_icons/book.svg";
  static const edit = "assets/svg_icons/edit.svg";

  static SvgPicture getWidget(String assetName,{ BoxFit fit = BoxFit.none, Color? color,
    double? width, double? height}) {
    if (width != null && height != null) {
      return SvgPicture.asset(
        assetName,
        fit: fit,
        color: color,
        width: width,
        height: height,
      );
    }
    return SvgPicture.asset(
        assetName,
        fit: fit,
        color: color
    );
  }
}
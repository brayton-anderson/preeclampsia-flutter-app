import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_color.dart';

// allowFontScaling:false
// ScreenUtil.instance = ScreenUtil.getInstance()..init(context);

// //If the design is based on the size of the iPhone6 ​​(iPhone6 ​​750*1334)
// ScreenUtil.instance = ScreenUtil(width: 750, height:
// 1334)..init(context);

// //If you wang to set the font size is scaled according to the system's
// "font size" assist option
// ScreenUtil.instance = ScreenUtil(width: 750, height: 1334,
// allowFontScaling: true)..init(context);

class AppTextStyles {
  static TextStyle appLogoAnimated(Color? color) {
    var colorizeTextStyle = TextStyle(
      fontSize: 60.0.sp,
      fontFamily: 'Pacifico',
      fontWeight: FontWeight.bold,
      color: color ?? AppColors.textC,
    );
    return colorizeTextStyle;
  }

  static TextStyle appLogoAnimatedNunito(Color? color) {
    var colorizeTextStyle = TextStyle(
      fontSize: 60.0.sp,
      fontFamily: 'Nunito',
      fontWeight: FontWeight.w800,
      color: color ?? AppColors.textC,
    );
    return colorizeTextStyle;
  }

  static TextStyle textStyleTitleExtraSmall(Color? color) {
    var colorizeTextStyle = TextStyle(
      fontSize: 12.0.sp,
      fontFamily: 'Nunito',
      fontWeight: FontWeight.w800,
      color: color ?? AppColors.textC,
    );
    return colorizeTextStyle;
  }
  static TextStyle? textStyleExtraSmall(Color? color) {
    var colorizeTextStyle = TextStyle(
      fontSize: 12.0.sp,
      fontFamily: 'Nunito',
      fontWeight: FontWeight.w400,
      color: color ?? AppColors.textC,
    );
    return colorizeTextStyle;
  }

  static TextStyle? textStyleTitlesmall(Color? color) {
    var colorizeTextStyle = TextStyle(
      fontSize: 14.0.sp,
      fontFamily: 'Nunito',
      fontWeight: FontWeight.w600,
      color: color ?? AppColors.textC,
    );
    return colorizeTextStyle;
  }
  static TextStyle textStylesmall(Color? color) {
    var colorizeTextStyle = TextStyle(
      fontSize: 14.0.sp,
      fontFamily: 'Nunito',
      fontWeight: FontWeight.w400,
      color: color ?? AppColors.textC,
    );
    return colorizeTextStyle;
  }

  static TextStyle textStyleTitlemedium(Color? color) {
    var colorizeTextStyle = TextStyle(
      fontSize: 18.0.sp,
      fontFamily: 'Nunito',
      fontWeight: FontWeight.w800,
      color: color ?? AppColors.textC,
    );
    return colorizeTextStyle;
  }
  static TextStyle textStylemedium(Color? color) {
    var colorizeTextStyle = TextStyle(
      fontSize: 18.0.sp,
      fontFamily: 'Nunito',
      fontWeight: FontWeight.w400,
      color: color ?? AppColors.textC,
    );
    return colorizeTextStyle;
  }

  static TextStyle textStyleTitlelarge(Color? color) {
    var colorizeTextStyle = TextStyle(
      fontSize: 22.0.sp,
      fontFamily: 'Nunito',
      fontWeight: FontWeight.w800,
      color: color ?? AppColors.textC,
    );
    return colorizeTextStyle;
  }
  static TextStyle textStylelarge(Color? color) {
    var colorizeTextStyle = TextStyle(
      fontSize: 22.0.sp,
      fontFamily: 'Nunito',
      fontWeight: FontWeight.w400,
      color: color ?? AppColors.textC,
    );
    return colorizeTextStyle;
  }

  static TextStyle textStyleTitleExtralarge(Color? color) {
    var colorizeTextStyle = TextStyle(
      fontSize: 24.0.sp,
      fontFamily: 'Nunito',
      fontWeight: FontWeight.w800,
      color: color ?? AppColors.textC,
    );
    return colorizeTextStyle;
  }
  static TextStyle textStyleExtralarge(Color? color) {
    var colorizeTextStyle = TextStyle(
      fontSize: 24.0.sp,
      fontFamily: 'Nunito',
      fontWeight: FontWeight.w400,
      color: color ?? AppColors.textC,
    );
    return colorizeTextStyle;
  }

  static TextStyle textStyleTitlebig(Color? color) {
    var colorizeTextStyle = TextStyle(
      fontSize: 28.0.sp,
      fontFamily: 'Nunito',
      fontWeight: FontWeight.w800,
      color: color ?? AppColors.textC,
    );
    return colorizeTextStyle;
  }
  static TextStyle textStylebig(Color? color) {
    var colorizeTextStyle = TextStyle(
      fontSize: 28.0.sp,
      fontFamily: 'Nunito',
      fontWeight: FontWeight.w400,
      color: color ?? AppColors.textC,
    );
    return colorizeTextStyle;
  }

  static TextStyle textStyleTitleExtrabig(Color? color) {
    var colorizeTextStyle = TextStyle(
      fontSize: 30.0.sp,
      fontFamily: 'Nunito',
      fontWeight: FontWeight.w800,
      color: color ?? AppColors.textC,
    );
    return colorizeTextStyle;
  }
  static TextStyle textStyleExtrabig(Color? color) {
    var colorizeTextStyle = TextStyle(
      fontSize: 30.0.sp,
      fontFamily: 'Nunito',
      fontWeight: FontWeight.w400,
      color: color ?? AppColors.textC,
    );
    return colorizeTextStyle;
  }
}

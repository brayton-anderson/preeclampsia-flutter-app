import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'app_color.dart';
import 'app_text_style.dart';

class AppTextWidgets {
//   var spinkit = const SpinKitThreeBounce(
//   color: Colors.white,
//   size: 50.0,
// );

  static SpinKitThreeBounce spinkit(Color? color) {
    return SpinKitThreeBounce(
      color: color ?? AppColors.textC,
      size: 50.0,
    );
  }

  static Widget troveTextLogo(Color? color, String txt) {
    Widget smtxt = Text(
      txt,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 40.0.sp,
        fontFamily: 'Nunito',
        color: color ?? AppColors.textC,
        fontWeight: FontWeight.w500,
      ),
    );
    return smtxt;
  }

  static Widget extraESmallText(Color? color, String txt) {
    Widget smtxt = Text(
      txt,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 6.0.sp,
        fontFamily: 'Nunito',
        color: color ?? AppColors.textC,
        fontWeight: FontWeight.w400,
      ),
    );
    return smtxt;
  }

  static Widget extraSmallText(Color? color, String txt) {
    Widget smtxt = Text(
      txt,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 12.0.sp,
        fontFamily: 'Nunito',
        color: color ?? AppColors.textC,
        fontWeight: FontWeight.w400,
      ),
    );
    return smtxt;
  }

  static Widget extraSmallTextTittle(Color? color, String txt) {
    Widget smtxt = Text(
      txt,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 12.0.sp,
        fontFamily: 'Nunito',
        color: color ?? AppColors.textC,
        fontWeight: FontWeight.w800,
      ),
    );
    return smtxt;
  }

  static Widget smallTextAlignment(Color? color, String txt, TextAlign? val) {
    Widget smtxt = Text(
      txt,
      textAlign: val,
      style: TextStyle(
        fontSize: 14.0.sp,
        fontFamily: 'Nunito',
        color: color ?? AppColors.textC,
        fontWeight: FontWeight.w400,
      ),
    );
    return smtxt;
  }

  static Widget smallText(Color? color, String txt) {
    Widget smtxt = Text(
      txt,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 14.0.sp,
        fontFamily: 'Nunito',
        color: color ?? AppColors.textC,
        fontWeight: FontWeight.w400,
      ),
    );
    return smtxt;
  }

  static Widget smallTextAlignmentTittle(
      Color? color, String txt, TextAlign? val) {
    Widget smtxt = Text(
      txt,
      textAlign: val,
      style: TextStyle(
        fontSize: 16.0.sp,
        fontFamily: 'Nunito',
        color: color ?? AppColors.textC,
        fontWeight: FontWeight.w800,
      ),
    );
    return smtxt;
  }

  static Widget smallTextTittle(Color? color, String txt) {
    Widget smtxt = Text(
      txt,
      textAlign: TextAlign.center,
      softWrap: true,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: 14.0.sp,
        fontFamily: 'Nunito',
        color: color ?? AppColors.textC,
        fontWeight: FontWeight.w800,
      ),
    );
    return smtxt;
  }

  static Widget mediumTextTittle(Color? color, String txt) {
    Widget smtxt = Text(
      txt,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 18.0.sp,
        fontFamily: 'Nunito',
        color: color ?? AppColors.textC,
        fontWeight: FontWeight.w800,
      ),
    );
    return smtxt;
  }

  static Widget mediumText(Color? color, String txt) {
    Widget smtxt = Text(
      txt,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 18.0.sp,
        fontFamily: 'Nunito',
        color: color ?? AppColors.textC,
        fontWeight: FontWeight.w400,
      ),
    );
    return smtxt;
  }

  static Widget largeText(Color? color, String txt) {
    Widget smtxt = Text(
      txt,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 22.0.sp,
        fontFamily: 'Nunito',
        color: color ?? AppColors.textC,
        fontWeight: FontWeight.w400,
      ),
    );
    return smtxt;
  }

  static Widget largeTextTittle(Color? color, String txt) {
    Widget smtxt = Text(
      txt,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 22.0.sp,
        fontFamily: 'Nunito',
        color: color ?? AppColors.textC,
        fontWeight: FontWeight.w800,
      ),
    );
    return smtxt;
  }

  static Widget extraLargeTextTittle(Color? color, String txt) {
    Widget smtxt = Text(
      txt,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 24.0.sp,
        fontFamily: 'Nunito',
        color: color ?? AppColors.textC,
        fontWeight: FontWeight.w800,
      ),
    );
    return smtxt;
  }

  static Widget extraLargeText(Color? color, String txt) {
    Widget smtxt = Text(
      txt,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 24.0.sp,
        fontFamily: 'Nunito',
        color: color ?? AppColors.textC,
        fontWeight: FontWeight.w400,
      ),
    );
    return smtxt;
  }

  static Widget bigText(Color? color, String txt) {
    Widget smtxt = Text(
      txt,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 28.0.sp,
        fontFamily: 'Nunito',
        color: color ?? AppColors.textC,
        fontWeight: FontWeight.w400,
      ),
    );
    return smtxt;
  }

  static Widget bigTextTittle(Color? color, String txt) {
    Widget smtxt = Text(
      txt,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 28.0.sp,
        fontFamily: 'Nunito',
        fontWeight: FontWeight.w800,
        color: color ?? AppColors.textC,
      ),
    );
    return smtxt;
  }

  static Widget extraBigTextTittle(Color? color, String txt) {
    Widget smtxt = Text(
      txt,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 30.0.sp,
        fontFamily: 'Nunito',
        fontWeight: FontWeight.w800,
        color: color ?? AppColors.textC,
        //color: color ?? (Theme.of(context!).brightness == Brightness.dark ? const Color(0xFF1e1e1e) : AppColors.kPrimaryColor.shade50),
      ),
    );
    return smtxt;
  }

  static Widget extraBigText(color, String txt) {
    Widget smtxt = Text(
      txt,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 30.0.sp,
        fontFamily: 'Nunito',
        fontWeight: FontWeight.w400,
        color: color ?? AppColors.textC,
      ),
    );
    return smtxt;
  }

  static AnimatedTextKit logoColorisedAnimatedText() {
    AnimatedTextKit animatedText = AnimatedTextKit(
      animatedTexts: [
        ColorizeAnimatedText(
          'You',
          textStyle: AppTextStyles.appLogoAnimatedNunito(null),
          textAlign: TextAlign.center,
          colors: AppColors.appLogoAnimatedColor(),
        ),
        ColorizeAnimatedText(
          'Are',
          textAlign: TextAlign.center,
          textStyle: AppTextStyles.appLogoAnimatedNunito(null),
          colors: AppColors.appLogoAnimatedColor(),
        ),
        ColorizeAnimatedText(
          'Trove',
          textStyle: AppTextStyles.appLogoAnimated(Colors.white),
          colors: AppColors.appLogoAnimatedColor(),
        ),
      ],
      isRepeatingAnimation: true,
      totalRepeatCount: 1,
      onTap: () {
        if (kDebugMode) {
          print("Tap Event");
        }
      },
    );

    return animatedText;
  }
}

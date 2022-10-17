import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_color.dart';
import 'app_text_widget.dart';

showAlertMessage(
    BuildContext context, WidgetRef refs, String msg, String title) {
  AlertDialog alert = AlertDialog(
    backgroundColor: AppColors.cardC,
    title: AppTextWidgets.smallTextAlignmentTittle(
        AppColors.textC, title, TextAlign.start),
    content: Container(
      width: double.infinity,
      height: 120,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: AppColors.cardC),
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: AppTextWidgets.smallTextAlignment(
          AppColors.textC, msg, TextAlign.start),
    ),
    alignment: AlignmentGeometry.lerp(
        Alignment.bottomCenter, Alignment.bottomCenter, 1),
    contentPadding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
    insetPadding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
    actions: [
      OutlinedButton(
        style: OutlinedButton.styleFrom(
            elevation: 6,
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
            side: BorderSide(color: AppColors.textC, width: 1.sp),
            shadowColor: AppColors.borderC.withOpacity(0.1),
            backgroundColor: AppColors.borderC.withOpacity(0.15),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(1000))),
        child: AppTextWidgets.smallTextTittle(AppColors.textC, "Continue"),
        onPressed: () async {
          List dta = ["appUsage", 11];
          // await refs
          //     .watch(updateUserSettingsProvider(dta).future);
          // if (Platform.isAndroid) {
          //   await refs
          //       .watch(postAndroidDeviceData.future)
          //       .whenComplete(() => Navigator.of(context).pop());
          // } else if (Platform.isIOS) {
          //   await refs
          //       .watch(postIosDeviceData.future)
          //       .whenComplete(() => Navigator.of(context).pop());
          // }
        },
      ),
    ],
  );

  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return alert;
    },
  );
  //  showDialog(
  //  // barrierDismissible: false,
  //     context: context,
  //     builder: (BuildContext context) {
  //       return

  //       //  Dialog(
  //       //     backgroundColor: AppColors.cardC,
  //       //     insetPadding: const EdgeInsets.all(10),
  //       //     insetAnimationCurve: Curves.easeInOutSine,
  //       //     child:

  //           Stack(
  //             alignment: Alignment.bottomCenter,
  //             children: <Widget>[

  //               Positioned(
  //                   top: -100,
  //                   child: Image.network("https://i.imgur.com/2yaf2wb.png",
  //                       width: 150, height: 150))
  //             ],
  //           );
  //     });
}

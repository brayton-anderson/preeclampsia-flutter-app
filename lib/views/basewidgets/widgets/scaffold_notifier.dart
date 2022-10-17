import 'package:flutter/material.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';

scaffoldNotifier(BuildContext? conx, Size m, String? txt, String? clr, int n) {
  // ScaffoldMessenger.of(conx!).showSnackBar(SnackBar(
  //   elevation: 4,
  //   width: m.width - 100,
  //   behavior: SnackBarBehavior.floating,
  //   backgroundColor: clr=="info"? AppColors.info: clr=="error"?AppColors.error:AppColors.backgroundC,
  //   duration: Duration(milliseconds: n),
  //   dismissDirection: DismissDirection.endToStart,
  //   content: AppTextWidgets.smallTextTittle(AppColors.kPrimaryColor.shade50, txt!),
  // ));

  AnimatedSnackBar.material(
//clr!.toUpperCase(),
  txt!,
  type: clr=="info"? AnimatedSnackBarType.info: clr=="error"? AnimatedSnackBarType.error:clr=="warning"? AnimatedSnackBarType.warning:AnimatedSnackBarType.success,
  duration: Duration(milliseconds: n),
  //brightness: isDarkMode? Brightness.dark :Brightness.light,
  mobileSnackBarPosition: MobileSnackBarPosition.top, // Position of snackbar on mobile devices
  desktopSnackBarPosition: DesktopSnackBarPosition.topRight,
).show(
  conx!,
);
}

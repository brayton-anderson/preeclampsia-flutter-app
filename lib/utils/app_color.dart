import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

var brightness = SchedulerBinding.instance.window.platformBrightness;
bool isDarkMode = brightness == Brightness.dark;

class AppColors {
  static int themes = 2;
  static Color warning = themes == 2
      ? isDarkMode
          ? kPrimaryColor.shade900
          : kPrimaryColor.shade200
      : themes == 1
          ? kPrimaryColor.shade900
          : kPrimaryColor.shade200;
  static Color error = isDarkMode
      ? const Color(0xFF1e1e1e)
      : const Color.fromARGB(255, 236, 236, 236);
  static Color info = themes == 2
      ? isDarkMode
          ? kPrimaryColor.shade700
          : kPrimaryColor.shade400
      : themes == 1
          ? kPrimaryColor.shade700
          : kPrimaryColor.shade400;
  static Color backgroundC = themes == 2
      ? isDarkMode
          ? const Color(0xFF181818)
          : const Color(0xFFF9F9F9)
      : themes == 1
          ? const Color(0xFF181818)
          : const Color(0xFFF9F9F9);
  static Color textC = themes == 2
      ? isDarkMode
          ? const Color.fromARGB(255, 224, 224, 224)
          : const Color.fromARGB(255, 70, 70, 70)
      : themes == 1
          ? const Color.fromARGB(255, 224, 224, 224)
          : const Color.fromARGB(255, 70, 70, 70);
  static Color textTittleC = themes == 2
      ? isDarkMode
          ? const Color(0xFFFFFFFF)
          : const Color(0xFF181818)
      : themes == 1
          ? const Color(0xFFFFFFFF)
          : const Color(0xFF181818);

  static Color cardC = themes == 2
      ? isDarkMode
          ? const Color(0xFF1e1e1e)
          : const Color(0xFFFFFFFF)
      : themes == 1
          ? const Color(0xFF1e1e1e)
          : const Color(0xFFFFFFFF);
  static Color overlaysC = themes == 2
      ? isDarkMode
          ? const Color(0xFF202020)
          : const Color(0xFFFFFFFF)
      : themes == 1
          ? const Color(0xFF202020)
          : const Color(0xFFFFFFFF);

  static Color buttonsC = themes == 2
      ? isDarkMode
          ? const Color(0xFF313131)
          : const Color(0xFFF0F0F0)
      : themes == 1
          ? const Color(0xFF313131)
          : const Color(0xFFF0F0F0);

  static Color inputsC = themes == 2
      ? isDarkMode
          ? const Color(0xFF121212)
          : const Color(0xFFFFFFFF)
      : themes == 1
          ? const Color(0xFF121212)
          : const Color(0xFFFFFFFF);
  static Color choiceC = themes == 2
      ? isDarkMode
          ? const Color(0xFF464646)
          : const Color(0xFFE0E0E0)
      : themes == 1
          ? const Color(0xFF464646)
          : const Color(0xFFE0E0E0);
  static Color borderC = const Color(0xFF9E9E9E);

  //dark                light
  //back 181818         #F9F9F9 #
  //card 1e1e1e         #FFFFFF
  //overlays 202020     #FFFFFF
  //buttons 313131      #F0F0F0
  //inputs 121212       #FFFFFF
  //choice 464646       E0E0E0
  static const MaterialColor kSecondaryColor = MaterialColor(
    0xFF05c5c7,
    <int, Color>{
      50: Color(0xFFeffefd),
      100: Color(0xFFc8fffa),
      200: Color(0xFF90fff6),
      300: Color(0xFF51f7f1),
      400: Color(0xFF1bdcdb),
      500: Color(0xFF05c5c7),
      600: Color(0xFF019ba0),
      700: Color(0xFF06797f),
      800: Color(0xFF0a6065),
      900: Color(0xFF0e4f53),
    },
  );

  static const MaterialColor kPrimaryColor = MaterialColor(
    0xFF1ec3ff,
    <int, Color>{
      50:  Color(0xFFffe5fd),
          100:  Color(0xFFffcffc),
          200:  Color(0xFFffa9f6),
          300:  Color(0xFFff75eb),
          400:  Color(0xFFff3fce),
          500:  Color(0xFFff14ae),
          600:  Color(0xFFff009f),
          700:  Color(0xFFff00a0),
          800:  Color(0xFFe3008e),
          900:  Color(0xFF420027),
    },
  );
static List colorsGrid = [
   const Color(0xFF1ec3ff),
   const Color(0xFF06a8ff),
   const Color(0xFF008df2),
   const Color(0xFF0871c5),
   const Color(0xFF0d609b),
];


  static List<Color> appLogoAnimatedColor() {
    var colorizeColors = [
      kPrimaryColor.shade50,
      kPrimaryColor.shade100,
      kPrimaryColor.shade800,
      kPrimaryColor.shade900,
    ];
    return colorizeColors;
  }
}

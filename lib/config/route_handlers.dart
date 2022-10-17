import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import '../views/authentication/login/loginscreen.dart';
import '../views/authentication/register/registrationscreen.dart';
import '../views/authentication/resetpass/createnewpass.dart';
import '../views/categoriescreen/categoriescreen.dart';
import '../views/homescreen/homescreen.dart';
import '../views/onboarding/onboadingscreen.dart';
import '../views/splashacreen/splashscreen.dart';


Handler? splashHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const Splashscreen();
});

// Handler? testpageHandler = Handler(
//     handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
//   return const MyAppTest();
// });
// Handler? transitionpageHandler = Handler(
//     handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
//   return const PageTransition();
// });

Handler?  resetPassHandler = Handler(handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    Createnewpass? createPassScreen = ModalRoute.of(context!)?.settings.arguments as Createnewpass?;
    return createPassScreen ?? Createnewpass(
      email: params['email'][0], resetToken: params['token'][0],
    );
  });

Handler?  loginHandler = Handler(handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    Loginscreen? loginScreen = ModalRoute.of(context!)?.settings.arguments as Loginscreen?;
    return loginScreen ?? const Loginscreen();
  });

Handler?  registrationHandler = Handler(handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    Registrationscreen? registrationScreen = ModalRoute.of(context!)?.settings.arguments as Registrationscreen?;
    return registrationScreen ?? const Registrationscreen();
  });

Handler?  onboardingHandler = Handler(handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    Onboadingscreen? onboadingScreen = ModalRoute.of(context!)?.settings.arguments as Onboadingscreen?;
    return onboadingScreen ?? const Onboadingscreen();
  });

Handler?  categoriesScrHandler = Handler(handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    Categoriescreen? categoriesScr = ModalRoute.of(context!)?.settings.arguments as Categoriescreen?;
    return categoriesScr ?? const Categoriescreen();
  });
Handler?  homePageHandler = Handler(handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    Homescreen? homePageScreen = ModalRoute.of(context!)?.settings.arguments as Homescreen?;
    return homePageScreen ?? const Homescreen();
  });

// var demoRouteHandler = Handler( OnboardingNextScreen
//     handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
//   String? message = params["message"]?.first;
//   String? colorHex = params["color_hex"]?.first;
//   String? result = params["result"]?.first;
//   Color color = Color(0xFFFFFFFF);
//   if (colorHex != null && colorHex.length > 0) {
//     color = Color(ColorHelpers.fromHexString(colorHex));
//   }
//   return DemoSimpleComponent(
//       message: message ?? 'Testing', color: color, result: result);
// });

// var demoFunctionHandler = Handler(
//     type: HandlerType.function,
//     handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
//       String? message = params["message"]?.first;
//       showDialog(
//         context: context!,
//         builder: (context) {
//           return AlertDialog(
//             title: Text(
//               "Hey Hey!",
//               style: TextStyle(
//                 color: const Color(0xFF00D6F7),
//                 fontFamily: "Lazer84",
//                 fontSize: 22.0,
//               ),
//             ),
//             content: Text("$message"),
//             actions: <Widget>[
//               Padding(
//                 padding: EdgeInsets.only(bottom: 8.0, right: 8.0),
//                 child: TextButton(
//                   onPressed: () {
//                     Navigator.of(context).pop(true);
//                   },
//                   child: Text("OK"),
//                 ),
//               ),
//             ],
//           );
//         },
//       );
//       return;
//     });

/// Handles deep links into the app
/// To test on Android:
///
/// `adb shell am start -W -a android.intent.action.VIEW -d "fluro://deeplink?path=/message&mesage=fluro%20rocks%21%21" com.theyakka.fluro`
// var deepLinkHandler = Handler(
//     handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
//   String? colorHex = params["color_hex"]?.first;
//   String? result = params["result"]?.first;
//   Color color = Color(0xFFFFFFFF);
//   if (colorHex != null && colorHex.length > 0) {
//     color = Color(ColorHelpers.fromHexString(colorHex));
//   }
//   return DemoSimpleComponent(
//       message: "DEEEEEP LINK!!!", color: color, result: result);
// });
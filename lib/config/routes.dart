import 'package:fluro/fluro.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'route_handlers.dart';

class Routes {
  static String splash = "/splash";
  static String login = "/login";
  static String register = "/register";
  static String forgotPassword = "/forgotpassword";
  static String onboarding = "/onboarding";
  static String categoriesScreen = "/categoriesscreen";
  static String testpage = "/testpage";
  static String transitionpage = "/transitionpage";
  static String homepage = "/transitionpage";

  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      if (kDebugMode) {
        print("ROUTE WAS NOT FOUND !!!");
      }
      return;
    });
    router.define(splash, handler: splashHandler, transitionType: TransitionType.inFromTop);
    router.define(login, handler: loginHandler, transitionType: TransitionType.inFromBottom);
    router.define(register, handler: registrationHandler, transitionType: TransitionType.inFromBottom);
    router.define(forgotPassword, handler: resetPassHandler, transitionType: TransitionType.inFromBottom);
    router.define(onboarding, handler: onboardingHandler, transitionType: TransitionType.inFromLeft);
    router.define(categoriesScreen, handler: categoriesScrHandler, transitionType: TransitionType.inFromRight);
    router.define(homepage, handler: homePageHandler, transitionType: TransitionType.inFromTop);
    //router.define(testpage, handler: testpageHandler, transitionType: TransitionType.fadeIn);
    //router.define(transitionpage, handler: transitionpageHandler, transitionType: TransitionType.inFromLeft);
    // router.define(demoSimple, handler: demoRouteHandler);
    // router.define(demoSimpleFixedTrans,
    //     handler: demoRouteHandler, transitionType: TransitionType.inFromLeft);
    // router.define(demoFunc, handler: demoFunctionHandler);
    // router.define(deepLink, handler: deepLinkHandler);
  }
}
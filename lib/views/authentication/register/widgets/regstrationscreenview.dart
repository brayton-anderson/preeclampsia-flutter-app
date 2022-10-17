import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_animations/simple_animations.dart';

import '../../../../config/routes.dart';
import '../../../../helpers/email_checker.dart';
import '../../../../helpers/string_helper.dart';
import '../../../../models/contentmodels/modelcarenc.dart';
import '../../../../models/contentmodels/usersettings/preeclampsiausersettings.dart';
import '../../../../providers/ap.dart';
import '../../../../repositories/preeclamsiausersettingsrepo.dart';
import '../../../../utils/app_color.dart';
import '../../../../utils/app_text_widget.dart';
import '../../../basewidgets/widgets/material_widgets.dart';
import '../../../basewidgets/widgets/scaffold_notifier.dart';
import '../../../onboarding/onboadingscreen.dart';
import 'registrationformview.dart';

class RegistrationScreenView extends StatefulWidget {
  final double? height;
  final double? width;
  const RegistrationScreenView(
      {Key? key, required this.height, required this.width})
      : super(key: key);

  @override
  RegistrationScreenViewState createState() => RegistrationScreenViewState();
}

class RegistrationScreenViewState extends State<RegistrationScreenView> {
  // final TextEditingController? emailController = TextEditingController();
  // final TextEditingController? passwordController = TextEditingController();
  final ScrollController? controller = ScrollController();
  int ckemail = 0;
  int strt = 0;
  // final ValueNotifier<TextEditingController>? emailController =
  //     ValueNotifier(TextEditingController());
  Control? controlonne = Control.play;
  Control controltwo = Control.playReverse;
  int cnt = 0;
  int cont = 0;

  final loginformKey = GlobalKey<RegistrationformState>();
  final controlProvider =
      Provider.family<Control, Controlss?>((ref, controler) {
    //final wsClient = ref.watch(websocketClientProvider);
    Control? control;
    if (controler!.two == 1) {
      control =
          (controler.one == Control.play) ? Control.playReverse : Control.play;
    } else {
      control = Control.playReverse;
    }

    return control;
  });

  @override
  void initState() {
    super.initState();
    setState(() {});
    // emailController?.addListener(printLatestValue);
    // passwordController?.addListener(printPassValue);
  }

  final controlTwoProvider =
      Provider.family<Control, Controlss>((ref, controler) {
    Control? control;
    if (controler.two == 0) {
      control =
          (controler.one == Control.play) ? Control.play : Control.playReverse;
    } else {
      control = Control.playReverse;
    }

    return control;
  });

  printPassValue() {
    if (passwordController.text.isNotEmpty) {
      String resp = EmailChecker.checkIfIsUsername(emailController.text);
      if (resp == "email") {
        setState(() {
          ckemail = 1;
        });
      } else if (resp == "username") {
        setState(() {
          ckemail = 2;
        });
      } else if (resp == "short") {
        setState(() {
          ckemail = 3;
        });
      } else {
        setState(() {
          ckemail = 0;
        });
      }
    }
  }

  //checkIfIsUsername
  printLatestValue() {
    if (emailController.text.isNotEmpty) {
      setState(() {
        cnt = 1;
        cont = 1;
        if (kDebugMode) {
          print('activated controller');
        }
      });
    } else {
      //setState(() {
      cont = 0;
      cnt = 0;
      // });
    }
  }

  @override
  void dispose() {
    //emailController!.dispose();
    //passwordController!.dispose();
    // ref!.watch(emailControllerProvider)!.dispose();
    //ref!.watch(controllerProvider)!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ref.read(counterProvider.notifier).state++;

    return SafeArea(
      child: Consumer(
          builder: (BuildContext context, WidgetRef aref, Widget? child) {
        return SingleChildScrollView(
          controller: controller,
          physics: const BouncingScrollPhysics(),
          child: SizedBox(
            height: ((widget.height!) - (widget.height! / 4) - 280).h,
            child: _listView(aref),
          ),
        );
      }),
    );
  }

  int valDate(String? pass, String? email) {
    int? val;
    if (pass!.isEmpty && email!.isEmpty) {
      val = 0;
    } else {
      val = 1;
    }
    return val;
  }

  int checkIsFail(WidgetRef auh) {
    int? k = auh.watch(passerrorProvider);
    final passEmpty = auh.watch(passerrorProvider);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (passEmpty == 1) {
        setState(() {
          k = passEmpty;
        });
      } else {
        setState(() {
          k = 0;
        });
      }
    });
    return k!;
  }

  Widget _listView(WidgetRef aref) {
    final authprovider = aref.watch(authNewProvider);

    return ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        Registrationform(
          key: loginformKey,
        ),
        SizedBox(
          height: 70.h,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () async {
                    final usersetsrepository =
                        aref.watch(userSettingsRepositoryProvider);
                    aref.watch(counterProvider.notifier).state = 0;

                    //check if not null
                    //check is valid email else username
                    //only allow click once
                    //start loader provider

                    if (loginformKey.currentState!.formKey.currentState!
                        .validate()) {
                      aref.read(loaderProvider.notifier).state++;
                      setState(() {
                        strt = 1;
                      });
                      String resp = EmailChecker.checkIfIsUsername(
                          aref.watch(emailControllerProvider).text);
                      if (resp == "short") {
                        aref.watch(counterProvider.notifier).state = 1;
                        aref.read(loaderProvider.notifier).state = 0;
                        setState(() {
                          strt = 0;
                        });
                        scaffoldNotifier(
                            context,
                            Size(widget.width!, widget.height!),
                            "Please update your email length",
                            "info",
                            600);
                      } else if (checkIsFail(aref) == 0) {
                        aref.watch(counterProvider.notifier).state = 3;
                        aref.read(loaderProvider.notifier).state = 0;
                        setState(() {
                          strt = 0;
                        });
                        scaffoldNotifier(
                            context,
                            Size(widget.width!, widget.height!),
                            "Please update your password strength",
                            "info",
                            2100);
                      } else {
                        final email = replaceWhitespacesRegex(
                            aref.watch(emailControllerProvider).text, ' ');
                        final pass = replaceWhitespacesRegex(
                            aref.watch(controllerProvider).text, ' ');
                        final user = replaceWhitespacesRegex(
                            aref.watch(usernameControllerProvider).text, ' ');
                        String dt = await aref.watch(authprovider
                            .registrationProvider(
                                Ustore(email: email, pass: pass, uname: user))
                            .future);
                        // .when(data: (data) async {
                        if (kDebugMode) {
                          print("top data ----- $dt");
                        }
                        await Future<void>.delayed(
                                const Duration(milliseconds: 550))
                            .then((value) {
                          if (dt == "authenticated") {
                            PreEclampsiaUserSettings? troveUserSettings =
                                usersetsrepository.currentUserSettings!.value;
                            if (troveUserSettings.onboadingScreen == "1") {
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  Routes.homepage, (route) => false);
                            } else {
                              Navigator.of(context).pushReplacementNamed(
                                  Routes.onboarding,
                                  arguments: const Onboadingscreen());
                            }
                          } else if (dt == "not-authenticated") {
                            aref.watch(counterProvider.notifier).state = 2;
                            aref.read(loaderProvider.notifier).state = 0;
                            setState(() {
                              strt = 0;
                            });
                            scaffoldNotifier(
                                context,
                                Size(widget.width!, widget.height!),
                                "Please confirm your email and password then try again.",
                                "info",
                                2100);
                          } else {
                            aref.watch(counterProvider.notifier).state = 5;
                            aref.read(loaderProvider.notifier).state = 0;
                            setState(() {});
                            scaffoldNotifier(
                                context,
                                Size(widget.width!, widget.height!),
                                "An error just occured. Please retry",
                                "error",
                                2100);
                          }
                        });
                      }
                    }
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 34.0.w ),
                    child: Container(
                      height: 50.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: AppColors.kPrimaryColor.shade600,
                      ),
                      child: Center(
                        child: aref.watch(loaderProvider) == 0
                            ? AppTextWidgets.mediumTextTittle(
                                AppColors.kPrimaryColor.shade50, "Sign in")
                            : SizedBox(
                                height: 15.h,
                                // width: 30.sp,
                                child:
                                    Center(child: AppTextWidgets.spinkit(null)),
                              ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        SizedBox(
          height: 20.h,
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 34.0.w
              ),
              child: SizedBox(
                height: 20.h,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 10.h,
                      width: ((widget.width! / 2) - (79.sp + 34.sp)),
                      child: Center(
                        child: Divider(
                          height: 1,
                          thickness: 1,
                          color: AppColors.borderC,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.0.w
                      ),
                      child: SizedBox(
                        height: 20.h,
                        child: Center(
                          child: AppTextWidgets.mediumText(null, 'Or'),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                      width: ((widget.width! / 2) - (79.sp + 34.sp)).w,
                      child: Center(
                        child: Divider(
                          height: 1,
                          thickness: 1,
                          color: AppColors.borderC,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        aref.watch(emailControllerProvider).text.isNotEmpty
            ? SizedBox(
                height: 0.h,
                width: 0.w,
              )
            : SizedBox(
                height: aref.watch(emailControllerProvider).text.isEmpty
                    ? 50.h
                    : 0.h,
                width: aref.watch(emailControllerProvider).text.isNotEmpty
                    ? 0.w
                    : (widget.width! - (64)).w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomAnimationBuilder<double>(
                      duration: const Duration(milliseconds: 800), //
                      control: aref.watch(controlTwoProvider(Controlss(
                          one: Control.play,
                          two: aref.watch(emailControllerProvider).text.isEmpty
                              ? 0
                              : 1))), // bind state variable to parameter
                      tween: Tween(begin: 370.0, end: 1.0),
                      curve: Curves.easeInCubic,
                      builder: (context, value, child) {
                        return Transform.translate(
                          // animation that moves childs from left to right
                          offset: Offset(value, 0),
                          child: child,
                        );
                      },
                      child: GestureDetector(
                        onTap: () {
                          // Navigator.of(context).pushNamed(Routes.testpage,
                          //     arguments: const MyAppTest());
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 34.0.w),
                          child: const GoogleButton(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
        SizedBox(
          height: 40.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 20.h,
                child: InkWell(
                  onTap: () {},
                  child: SizedBox(
                      height: 20.h,
                      child: Center(
                        child: AppTextWidgets.extraSmallTextTittle(
                            null, 'Forgot your password?'),
                      )),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

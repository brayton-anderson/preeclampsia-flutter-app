import 'package:flutter/material.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/routes.dart';
import '../../../providers/ap.dart';
import '../../../utils/app_color.dart';
import '../../../utils/app_text_widget.dart';
import '../../basewidgets/widgets/material_widgets.dart';
import '../register/registrationscreen.dart';
import 'widgets/loginscreenview.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({ Key? key }) : super(key: key);

  @override
  LoginscreenState createState() => LoginscreenState();
}

class LoginscreenState extends State<Loginscreen> {
  @override
  Widget build(BuildContext context) {
    final mediaQuer = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundC,
        //appBar: AppBar(),
        body: Center(
          child: SizedBox(
            width: mediaQuer.width,
            child: Consumer(
              builder: (context, auth, child) {
                //onStart();
                return SizedBox(
                  width: mediaQuer.width.w,
                  height: mediaQuer.height.h,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32.0.w, vertical: 32.0.h),
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            _headerView(context, mediaQuer),
                            SizedBox(
                              // height: ((mediaQuer.height) -
                              //     (mediaQuer.height / 4) -
                              //     65.sp),
                              child: LoginScreenView(
                                height: mediaQuer.height.h,
                                width: mediaQuer.width.w,
                              ),
                            ),
                            _footerView(),
                          ],
                        ),
                        SizedBox(
                          height: 156.h,
                          // width: 100.sp,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              // SizedBox(height: 50.sp,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SizedBox(
                                    height: 50.h,
                                  ),
                                  SizedBox(
                                      height: 50.h,
                                      width: 50.h,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          checkIsError(auth) == 0
                                              ? SizedBox(
                                                  height: 0.h, width: 0.w)
                                              : checkIsError(auth) == 1
                                                  ? AppTextWidgets.extraESmallText(
                                                      Colors.redAccent,
                                                      "* Email or Username is too short")
                                                  : checkIsError(auth) == 2
                                                      ? AppTextWidgets
                                                          .extraESmallText(
                                                              Colors.redAccent,
                                                              "* Email or Username is invalid")
                                                      : checkIsError(auth) == 3
                                                          ? AppTextWidgets
                                                              .extraESmallText(
                                                                  Colors
                                                                      .redAccent,
                                                                  "* Incorrect password strength")
                                                          : AppTextWidgets
                                                              .extraESmallText(
                                                                  Colors
                                                                      .redAccent,
                                                                  "* Error occured"),
                                        ],
                                      )),
                                  SizedBox(height: 5.h, width: 50.w),
                                  checkIsEmpty(auth)
                                      ? SizedBox(height: 0.h, width: 0.w)
                                      : checkIsFail(auth) == 1
                                          ? SizedBox(height: 0.h, width: 0.w)
                                          : SizedBox(
                                              height: 50.h,
                                              width: 50.w,
                                              child: FlutterPwValidator(
                                                controller: auth
                                                    .watch(controllerProvider)!,
                                                minLength: 8,
                                                uppercaseCharCount: 2,
                                                numericCharCount: 3,
                                                specialCharCount: 1,
                                                width: 100.w,
                                                height: 100.h,
                                                defaultColor: Colors.white,
                                                successColor: AppColors
                                                    .kPrimaryColor.shade600,
                                                failureColor: Colors.redAccent,
                                                // ignore: null_check_always_fails
                                                onSuccess: () {
                                                  auth
                                                      .read(passerrorProvider
                                                          .notifier)
                                                      .state = 1;
                                                },
                                                onFail: () {
                                                  auth
                                                      .read(passerrorProvider
                                                          .notifier)
                                                      .state = 0;
                                                },
                                                //onSuccess: yourCallbackFunction,
                                                //onFail: yourCallbackFunction
                                              ),
                                            ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  bool checkIsEmpty(WidgetRef auh) {
    bool? k = auh.watch(controllerProvider.notifier).state.text.isEmpty;
    final passEmpty =
        auh.watch(controllerProvider.notifier).state.text.isEmpty;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        k = passEmpty;
      });
    });

    return k!;
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

  int checkIsError(WidgetRef auh) {
    int? k = auh.watch(counterProvider);
    final passEmpty = auh.watch(counterProvider);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        k = passEmpty;
      });
    });

    return k!;
  }

  Widget _footerView() {
    return SizedBox(
      height: 15.h,
      child: Center(
        child: BottomButtonsCus(
          about: 'about us',
          data: 'on data',
          privacy: 'privacy',
          terms: 'our terms',
          color: AppColors.kPrimaryColor.shade600,
        ),
      ),
    );
  }

  Widget _headerView(BuildContext ctx, Size mediaQuer) {
    return SizedBox(
        height: ((mediaQuer.height / 4) - 60).h,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AppTextWidgets.troveTextLogo(
                  AppColors.kPrimaryColor.shade600, "Pre-Eclampsia"),
              AppTextWidgets.extraLargeText(null, "Account sign in"),
              SizedBox(
                height: 3.h,
              ),
              SizedBox(
                height: 20.h,
                child: InkWell(
                  onTap: () {
                    Navigator.of(ctx).pushNamed(Routes.register,
                        arguments: const Registrationscreen());
                  },
                  child: SizedBox(
                      height: 20.h,
                      child: Center(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            AppTextWidgets.extraSmallTextTittle(
                                null, 'Don\'t have an account?'),
                            SizedBox(
                              width: 5.w,
                            ),
                            AppTextWidgets.extraSmallTextTittle(
                                AppColors.kPrimaryColor.shade600, 'Sign up'),
                          ],
                        ),
                      )),
                ),
              ),
            ]));
  }
}

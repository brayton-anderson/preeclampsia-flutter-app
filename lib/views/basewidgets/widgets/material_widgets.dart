import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:simple_animations/simple_animations.dart';

import '../../../models/contentmodels/modelcarenc.dart';
import '../../../providers/ap.dart';
import '../../../utils/app_color.dart';
import '../../../utils/app_text_widget.dart';

class CircleAvatar extends ConsumerWidget {
  const CircleAvatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    return CustomAnimationBuilder<double>(
      duration: const Duration(milliseconds: 600),
      delay: Duration(milliseconds: (300 * 2).round()),
      curve: Curves.elasticOut,
      tween: Tween<double>(begin: 0, end: 1),
      control: Control.play,
      startPosition: 0.5,
      animationStatusListener: (status) {
        debugPrint('status updated: $status');
      },
      builder: (context, value, child) {
        return Positioned(
          top: 100,
          left: size.width / 2 - 50,
          child: Transform.scale(
            scale: value,
            alignment: Alignment.center,
            child: blueCircle(),
          ),
        );
      },
    );
  }

  Widget blueCircle() {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Colors.blue.shade700,
      ),
    );
  }
}

class BlueBar extends ConsumerWidget {
  const BlueBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomAnimationBuilder<double>(
      duration: const Duration(milliseconds: 600),
      tween: Tween<double>(begin: 0, end: 150),
      delay: Duration(milliseconds: (300 * 2).round()),
      curve: Curves.easeIn,
      control: Control.play,
      startPosition: 0.5,
      animationStatusListener: (status) {
        debugPrint('status updated: $status');
      },
      builder: (context, value, child) {
        return Container(
          height: value,
          width: double.infinity,
          color: Colors.blue,
        );
      },
    );
  }
}

class GoogleButton extends StatelessWidget {
  const GoogleButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.sp,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: AppColors.borderC,
          width: 1,
        ),
        color: AppColors.kPrimaryColor.shade600.withOpacity(0),
      ),
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 20.sp,
              width: 20.sp,
              child: Center(
                child: SvgPicture.asset("assets/images/google_logo.svg",
                    semanticsLabel: 'Google Logo'),
              ),
            ),
            SizedBox(
              height: 40.sp,
              width: 20.sp,
            ),
            SizedBox(
              height: 40.sp,
              child: Center(
                child: AppTextWidgets.smallTextTittle(
                    AppColors.kPrimaryColor.shade50, 'Sign in with Google'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OutlinedButtonCust extends StatefulWidget {
  final String? txt;
  final String? kkey;
  const OutlinedButtonCust({
    Key? key,
    required this.txt,
    required this.kkey,
  }) : super(key: key);

  @override
  OutlinedButtonCustState createState() => OutlinedButtonCustState();
}

class OutlinedButtonCustState extends State<OutlinedButtonCust> {
  AuthProvider? authProvider;

  @override
  Widget build(BuildContext context) {
    return Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
      return InkWell(
        onTap: () {
          
          if (widget.kkey == 'two') {
            ref.read(userStoreProvider(Uval(one: "one", two: xzxValue)));
            //authProvider?.user.identity = xzxValue;
            ref.read(pageProvider.notifier).state++;
            if (kDebugMode) {
              print(xzxValue.length);
            }
          } else {
            ref.read(userStoreProvider(Uval(one: "one", two: xzxValue)));
            //authProvider?.user.identity = xoxValue;
            ref.read(pageProvider.notifier).state++;
          }
        },
        child: Container(
          height: 50.sp,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: AppColors.kPrimaryColor.shade50,
              width: 1,
            ),
            color: AppColors.kPrimaryColor.shade600.withOpacity(0),
          ),
          child: Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50.sp,
                  child: Center(
                    child: AppTextWidgets.mediumTextTittle(
                        AppColors.kPrimaryColor.shade50, widget.txt!),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}

class BottomButtonsCus extends StatelessWidget {
  final String? terms;
  final String? privacy;
  final String? data;
  final String? about;
  final Color? color;
  const BottomButtonsCus({
    Key? key,
    required this.about,
    required this.data,
    required this.privacy,
    required this.terms,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {},
          child: AppTextWidgets.extraSmallText(color, terms!),
        ),
        SizedBox(width: 10.sp),
        InkWell(
          onTap: () {},
          child: AppTextWidgets.extraSmallText(color, privacy!),
        ),
        SizedBox(width: 10.sp),
        InkWell(
          onTap: () {},
          child: AppTextWidgets.extraSmallText(color, data!),
        ),
        SizedBox(width: 10.sp),
        InkWell(
          onTap: () {},
          child: AppTextWidgets.extraSmallText(color, about!),
        ),
      ],
    );
  }
}

class OrWidget extends StatelessWidget {
  const OrWidget({
    Key? key,
    required this.mediaQuer,
    //required this.widget,
    //required this.widget,
  }) : super(key: key);
  final Size? mediaQuer;
  //final RegistrationScreenTwo widget;
  //final RegistrationScreenTwo widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 34.0,
        right: 34.0,
      ),
      child: SizedBox(
        height: 20.sp,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 10.sp,
              width: ((mediaQuer!.width / 2) - (79.sp + 34.sp)),
              child: Center(
                child: Divider(
                  height: 1,
                  thickness: 1,
                  color: AppColors.borderC,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 5.0,
                right: 5.0,
              ),
              child: SizedBox(
                height: 20.sp,
                child: Center(
                  child: AppTextWidgets.mediumText(null, 'OR'),
                ),
              ),
            ),
            SizedBox(
              height: 10.sp,
              width: ((mediaQuer!.width / 2) - (79.sp + 34.sp)),
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
    );
  }
}

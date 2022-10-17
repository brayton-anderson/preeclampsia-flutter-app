import 'package:enclampsia/utils/app_color.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:async';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../models/contentmodels/modelcarenc.dart';
import '../../../providers/ap.dart';
import 'splashhoners.dart';

class LounchSplashScreen extends StatefulWidget {
  final String? targetRouteName;

  const LounchSplashScreen({Key? key, @required this.targetRouteName})
      : super(key: key);

  @override
  LounchSplashScreenState createState() => LounchSplashScreenState();
}

class LounchSplashScreenState extends State<LounchSplashScreen> {
  Timer? _timer;
  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  static double? h, w;

  @override
  Widget build(BuildContext context) {
    final mediaQ = MediaQuery.of(context).size;

    return Consumer(builder: (context, ref, child) {
      Dunt data = Dunt(one: context, two: null);
        ref.watch(notifierUserData(data));
      return Container(
        height: mediaQ.height.h,
        width: mediaQ.width.w,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  AppColors.kPrimaryColor.shade800,
                  AppColors.kPrimaryColor.shade300
                ],
                begin: FractionalOffset.topRight,
                end: FractionalOffset.bottomLeft,
                stops: const [0.0, 1.0],
                tileMode: TileMode.mirror)),
        child: SplashHoners(mediaQ: mediaQ),
      );
    });
  }

  // void onSizeSave(hi, wi) {
  //   setState(() {
  //     h = hi;
  //     w = wi;
  //     // _wrongPassword = true;
  //   });
  // }

  // @override
  // PreferredSizeWidget buildAppBar(BuildContext context) {
  //   return AppBar(title: Text('Register & Login'));
  // }

  @override
  void onLoggedIn() {
    //BlocProvider.of<AuthenticationBloc>(context).add(LoginEvent("username", "password"));
    Navigator.pushReplacementNamed(context, widget.targetRouteName!);
  }
}

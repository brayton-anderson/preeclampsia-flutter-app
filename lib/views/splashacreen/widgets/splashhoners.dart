import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_color.dart';

class SplashHoners extends StatelessWidget {
  const SplashHoners({
    Key? key,
    required this.mediaQ,
  }) : super(key: key);

  final Size mediaQ;

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      ClipPath(
          clipper: TopsCurve(), // TopCurve(mediaQ),
          child: Container(
            constraints: BoxConstraints(
                maxHeight: mediaQ.height.h,
                maxWidth: mediaQ.width.w,
                minHeight: mediaQ.height.h,
                minWidth: mediaQ.width.w),
            decoration:  BoxDecoration(
                gradient: LinearGradient(
                    colors: [AppColors.kPrimaryColor.shade900, AppColors.kPrimaryColor.shade800],
                    begin: FractionalOffset.topRight,
                    end: FractionalOffset.bottomLeft,
                    stops: const [0.0, 1.0],
                    tileMode: TileMode.mirror)),
          )),
      Container(
        constraints: BoxConstraints(
            maxHeight: mediaQ.height.h,
            maxWidth: mediaQ.width.w,
            minHeight: mediaQ.height.h,
            minWidth: mediaQ.width.w),
        child: Padding(
          padding: EdgeInsets.only(left: 12.w, right: 15.w, top: 172.h),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  child: Text(
                    'Pre',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontFamily: 'Nunito',
                      color: AppColors.kPrimaryColor.shade50,
                      fontSize: 120.sp,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ),
              ]),
        ),
      ),
      Container(
        constraints: BoxConstraints(
            maxHeight: mediaQ.height.h,
            maxWidth: mediaQ.width.w,
            minHeight: mediaQ.height.h,
            minWidth: mediaQ.width.w),
        child: Padding(
          padding: EdgeInsets.only(left: 14.w, right: 15.w, top: 174.h),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  child: Text(
                    'Pre',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontFamily: 'Nunito',
                      color: AppColors.kPrimaryColor.shade100,
                      fontSize: 120.sp,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ),
              ]),
        ),
      ),
      Container(
        constraints: BoxConstraints(
            maxHeight: mediaQ.height.h,
            maxWidth: mediaQ.width.w,
            minHeight: mediaQ.height.h,
            minWidth: mediaQ.width.w),
        child: Padding(
          padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 300.h),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  child: Text(
                    'Eclampsia',
                    textScaleFactor: 0.82.sp,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontFamily: 'Nunito',
                      color: AppColors.kPrimaryColor.shade50,
                      fontSize: 80.sp,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ),
              ]),
        ),
      ),
      Container(
        constraints: BoxConstraints(
            maxHeight: mediaQ.height.h,
            maxWidth: mediaQ.width.w,
            minHeight: mediaQ.height.h,
            minWidth: mediaQ.width.w),
        child: Padding(
          padding: EdgeInsets.only(left: 16.w, right: 15.w, top: 302.h),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  child: Text(
                    'Eclampsia',
                    textScaleFactor: 0.82.sp,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontFamily: 'Nunito',
                      color: AppColors.kPrimaryColor.shade100,
                      fontSize: 80.sp,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ),
              ]),
        ),
      ),
      Container(
        constraints: BoxConstraints(
            maxHeight: mediaQ.height.h,
            maxWidth: mediaQ.width.w,
            minHeight: mediaQ.height.w,
            minWidth: mediaQ.width.h),
        child: Padding(
          padding: EdgeInsets.only(left: 100.w, right: 15.w, top: 18.h),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  child: Container(
                    //alignment: Alignment.centerRight,
                    height: 42,
                    width: ((mediaQ.width / 3) - 30).w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(1000.r),
                      color: AppColors.kPrimaryColor.shade100,
                    ),
                    child: Center(
                        child: Text(
                      'Beta',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Nunito',
                        color: AppColors.kPrimaryColor.shade500,
                        fontSize: 30.sp,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                      ),
                    )),
                  ),
                ),
              ]),
        ),
      ),
      Container(
        constraints: BoxConstraints(
            maxHeight: mediaQ.height.h,
            maxWidth: mediaQ.width.w,
            minHeight: mediaQ.height.h,
            minWidth: mediaQ.width.w),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 15.w),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  height: 120.h,
                  width: 120.w,
                  child: Stack(children: [
                    Container(
                        //alignment: Alignment.centerRight,
                        height: 120.h,
                        width: 120.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1000.r),
                          color: AppColors.kPrimaryColor.shade50.withOpacity(0.0),
                        ),
                        child: Center(
                          child: SizedBox(
                            height: 100.h,
                            width: 100.w,
                           // child: Expanded(
                                child: CircularProgressIndicator(
                              backgroundColor: Colors.transparent,
                              strokeWidth: 1,
                              //valueColor: Animation< primarydark>,
                              color: AppColors.kPrimaryColor.shade50,
                            ),
                           // ),
                          ),
                        )),
                    Center(
                        child: Container(
                            //alignment: Alignment.centerRight,
                            height: 85.h,
                            width: 85.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(1000),
                              color: AppColors.kPrimaryColor.shade900.withOpacity(0.2),
                            ),
                            child:  Center(
                              child: SizedBox(
                                height: 85.h,
                                width: 85.w,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 3.h, vertical: 3.w),
                                  child: Center(
                                    child: Text(
                                      'Starting..',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: 'Nunito',
                                        color: AppColors.kPrimaryColor.shade50,
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w900,
                                        fontStyle: FontStyle.normal,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ))),
                  ]),
                ),
                SizedBox(
                  height: 100.h,
                ),
                 SizedBox(
                  height: 50.h,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 3.h, vertical: 3.w),
                    child: Center(
                      child: Text(
                        'From AndieLabs',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Nunito',
                          color: AppColors.kPrimaryColor.shade50,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w900,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ),
                  ),
                )
              ]),
        ),
      ),
    ]);
  }
}

class TopsCurve extends CustomClipper<Path> {
  //TopsCurve(Size mediaQ);

  @override
  Path getClip(Size size) {
    Path path = Path();
    final double _xScaling = size.width / 428;
    final double _yScaling = size.height / 926;
    path.lineTo(278.159 * _xScaling, 116.652 * _yScaling);
    path.cubicTo(
      313.063 * _xScaling,
      165.48 * _yScaling,
      373.025 * _xScaling,
      185.778 * _yScaling,
      428 * _xScaling,
      172.551 * _yScaling,
    );
    path.cubicTo(
      428 * _xScaling,
      172.551 * _yScaling,
      428 * _xScaling,
      926 * _yScaling,
      428 * _xScaling,
      926 * _yScaling,
    );
    path.cubicTo(
      428 * _xScaling,
      926 * _yScaling,
      0 * _xScaling,
      926 * _yScaling,
      0 * _xScaling,
      926 * _yScaling,
    );
    path.cubicTo(
      0 * _xScaling,
      926 * _yScaling,
      0 * _xScaling,
      0 * _yScaling,
      0 * _xScaling,
      0 * _yScaling,
    );
    path.cubicTo(
      0 * _xScaling,
      0 * _yScaling,
      255.468 * _xScaling,
      0 * _yScaling,
      255.468 * _xScaling,
      0 * _yScaling,
    );
    path.cubicTo(
      246.11 * _xScaling,
      38.9199 * _yScaling,
      253.054 * _xScaling,
      81.5312 * _yScaling,
      278.159 * _xScaling,
      116.652 * _yScaling,
    );
    path.cubicTo(
      278.159 * _xScaling,
      116.652 * _yScaling,
      278.159 * _xScaling,
      116.652 * _yScaling,
      278.159 * _xScaling,
      116.652 * _yScaling,
    );
    path.lineTo(141.183 * _xScaling, 211.655 * _yScaling);
    path.cubicTo(
      157.591 * _xScaling,
      199.926 * _yScaling,
      161.384 * _xScaling,
      177.117 * _yScaling,
      149.655 * _xScaling,
      160.709 * _yScaling,
    );
    path.cubicTo(
      137.926 * _xScaling,
      144.301 * _yScaling,
      115.117 * _xScaling,
      140.508 * _yScaling,
      98.7091 * _xScaling,
      152.237 * _yScaling,
    );
    path.cubicTo(
      82.3012 * _xScaling,
      163.966 * _yScaling,
      78.5082 * _xScaling,
      186.775 * _yScaling,
      90.2371 * _xScaling,
      203.183 * _yScaling,
    );
    path.cubicTo(
      101.966 * _xScaling,
      219.591 * _yScaling,
      124.775 * _xScaling,
      223.384 * _yScaling,
      141.183 * _xScaling,
      211.655 * _yScaling,
    );
    path.cubicTo(
      141.183 * _xScaling,
      211.655 * _yScaling,
      141.183 * _xScaling,
      211.655 * _yScaling,
      141.183 * _xScaling,
      211.655 * _yScaling,
    );
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}

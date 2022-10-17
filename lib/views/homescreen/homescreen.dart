import 'dart:async';

import 'package:enclampsia/utils/app_color.dart';
import 'package:enclampsia/views/basewidgets/widgets/scaffold_notifier.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:weather/weather.dart';

import '../../models/contentmodels/health/healthdata.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  HomescreenState createState() => HomescreenState();
}

class HomescreenState extends State<Homescreen> {
  Weather? weatherValues;
  HealthData? healtData;
  static String weatherMain = "Rain";
  static String stringTemp = "22";
  static String feelsLikeTemp = "22";
  static String getMessage = "It\'s 🍦 time";
  static String getWeatherIcon = "🌩";

  static String water = "0";
  static String distance = "0";
  static String steps = "0";
  static String babykicks = "0";
  static String fatalheartrate = "0";
  static String saturation = "0";
  static String temprature = "0";
  static String heartrate = "0";

  void listenForHealthData() async {
    final Stream<HealthData> stream = await pstHealthData.getServerData();
    stream.listen((HealthData healthData) {
      setState(() => healtData = healthData);
      setState(() {
        water = healtData!.water.toString();
        distance = healtData!.distance.toString();
        steps = healtData!.steps.toString();
        babykicks = healtData!.babykicks.toString();
        fatalheartrate = healtData!.fatalheartrate.toString();
        saturation = healtData!.saturation.toString();
        temprature = healtData!.temprature.toString();
        heartrate = healtData!.heartrate.toString();
      });
      if (kDebugMode) {
        print("...healtData starts here...");
        print(healtData!.babykicks);
        print("...healtData ends here...");
      }
    }, onError: (a) {
      if (kDebugMode) {
        print(a);
        print("...healtData has error...");
      }

      const messages = "";
      const button = "";
      const route = "";
      const request = "check internet";

      // getSnackbarNotification(messages, request, button, route);
    }, onDone: () {
      if (kDebugMode) {
        print("done fetching cloud data");
      }
    });
  }

  void getCurrentWeather() async {
    await weaVals.determinePosition().catchError((e) {
      NullThrownError;
      if (kDebugMode) {
        print(e);
      }
    }).then((value) async {
      Weather weaV = await weaVals.getCurrentWeather(value);
      if (kDebugMode) {
        print(weaV);
      }

      //await weaVals.setCurrentWeather(weaV);
      setState(() {
        weatherValues = weaV;
        weatherMain = weatherValues!.weatherMain!;
        stringTemp = weatherValues!.temperature!.celsius!.ceil().toString();
        feelsLikeTemp =
            weatherValues!.tempFeelsLike!.celsius!.ceil().toString();
        getMessage =
            weaVals.getMessage(weatherValues!.temperature!.celsius!.ceil());
        getWeatherIcon =
            weaVals.getWeatherIcon(weatherValues?.weatherConditionCode!);
        //weaVals.setCurrentWeather(weaV);
      });
    });
  }

  Timer? _timer;
  Timer? _timerTwo;
  int _start = 50;
  int _startTwo = 50;

  void startTimerOne() async {
    //startTimerOne();
    listenForHealthData();
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      // ignore: void_checks
      (Timer timer) async {
        if (_start == 0) {
          getBtData.mainNumbers();
          setState(() {
            _startTwo = 50;
            timer.cancel();
          });
          startTimerTwo();
          if (kDebugMode) {
            print("two started");
          }
          // Navigator.pushReplacementNamed(ctx, widget.targetRouteName);
          // _buildAuthorizedRoute(widget.targetRouteName, ctx);
        } else {
          setState(() {
            _start--;
            if (kDebugMode) {
              print(_start);
            }
          });
        }
      },
    );
  }

  void startTimerTwo() async {
    //startTimerOne();
    listenForHealthData();
    const oneSecTwo = Duration(seconds: 1);
    _timerTwo = Timer.periodic(
      oneSecTwo,
      // ignore: void_checks
      (Timer timerTwo) async {
        if (_startTwo == 0) {
          getBtData.mainNumbers();
          setState(() {
            _start = 50;
            timerTwo.cancel();
          });
          startTimerOne();
          //startTimerOne();
          if (kDebugMode) {
            print("one started");
          }
          // Navigator.pushReplacementNamed(ctx, widget.targetRouteName);
          // _buildAuthorizedRoute(widget.targetRouteName, ctx);
        } else {
          setState(() {
            _startTwo--;
            if (kDebugMode) {
              print(_startTwo);
            }
          });
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    if (widget.checkBldevice == "connected") {
      startTimerOne();
    } else {
      if (kDebugMode) {
        print("getter not started");
      }
    }
    getCurrentWeather();
    listenForHealthData();
    //logged = await userRepo.getIsLoggedIn();

    setState(() {});
    //startTimer();
    // _blocForm = FormLoginSignupBloc(AuthenticationApiProvider());
  }

  // @override
  // void onWrongPassword() {
  //   setState(() {
  //     // _wrongPassword = true;
  //   });
  // }

  static double? h, w;

  @override
  Widget build(BuildContext context) {
    const IconData bluetooth = IconData(0xe0e4, fontFamily: 'MaterialIcons');
    final mediaQ = MediaQuery.of(context).size;
    return Container(
      height: mediaQ.height,
      width: mediaQ.width,
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
      child: Stack(children: <Widget>[
        Container(
            constraints: BoxConstraints(
                maxHeight: mediaQ.height,
                minHeight: mediaQ.height,
                minWidth: mediaQ.width,
                maxWidth: mediaQ.width),
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Colors.black45,
                      Colors.black87,
                      Colors.black87,
                      Colors.black
                    ],
                    begin: FractionalOffset.topCenter,
                    end: FractionalOffset.bottomCenter,
                    stops: [0.0, 0.3, 0.6, 1.0],
                    tileMode: TileMode.decal)),
            child: SizedBox(
              height: mediaQ.height,
              width: mediaQ.width,
            )),
        Container(
          constraints: BoxConstraints(
              maxHeight: (mediaQ.height / 2) - 100,
              minHeight: (mediaQ.height / 2) - 100,
              minWidth: mediaQ.width,
              maxWidth: mediaQ.width),
          color: Colors.transparent,
          child: ClipPath(
            clipper: TopsCurve(), // TopCurve(mediaQ),
            child: Container(
              constraints: BoxConstraints(
                  maxHeight: (mediaQ.height / 2) - 100,
                  minHeight: (mediaQ.height / 2) - 100,
                  minWidth: mediaQ.width,
                  maxWidth: mediaQ.width),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        AppColors.kPrimaryColor.shade100,
                        AppColors.kPrimaryColor.shade400,
                        AppColors.kPrimaryColor.shade700,
                      ],
                      begin: FractionalOffset.topRight,
                      end: FractionalOffset.bottomLeft,
                      stops: const [0.0, 0.4, 1.0],
                      tileMode: TileMode.decal)),
              child: SizedBox(
                height: (mediaQ.height / 2) - 100,
              ),
            ),
          ),
        ),
        Container(
          constraints: BoxConstraints(
              maxHeight: mediaQ.height,
              minHeight: mediaQ.height,
              minWidth: mediaQ.width,
              maxWidth: mediaQ.width),
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.only(
                left: 8.0, right: 8.0, top: 46.0, bottom: 16.0),
            child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50,
                    child: Text(
                      'Holla, ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Nunito',
                        color: AppColors.kPrimaryColor.shade50,
                        fontSize: 48,
                        fontWeight: FontWeight.w900,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          usrData.user!.username!,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Nunito',
                            color: AppColors.textC,
                            fontSize: 30,
                            fontWeight: FontWeight.w900,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                        Text(
                          ' 👋',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            fontFamily: 'Nunito',
                            color: AppColors.textC,
                            fontSize: 25,
                            fontWeight: FontWeight.w800,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    height: 150,
                    width: (mediaQ.width) - 36,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      gradient: LinearGradient(
                          colors: [
                            AppColors.kPrimaryColor.shade900,
                            AppColors.cardC,
                            AppColors.cardC,
                            AppColors.kPrimaryColor.shade900
                          ],
                          begin: FractionalOffset.topRight,
                          end: FractionalOffset.bottomLeft,
                          stops: const [0.0, 0.2, 0.8, 1.0],
                          tileMode: TileMode.decal),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: Colors.black45.withOpacity(0.2),
                          blurRadius: 2.0,
                          offset: const Offset(0.1, 0.1),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 16, right: 16, top: 8, bottom: 8),
                      child: Container(
                        height: 118,
                        width: (mediaQ.width) - 68,
                        color: Colors.transparent,
                        child: Row(
                          children: [
                            Stack(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      getWeatherIcon,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: 'Nunito',
                                        color: AppColors.textC,
                                        fontSize: 60,
                                        fontWeight: FontWeight.w300,
                                        fontStyle: FontStyle.normal,
                                      ),
                                    ),
                                    Text(
                                      weatherMain,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: 'Nunito',
                                        color: AppColors.textC,
                                        fontSize: 31,
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FontStyle.normal,
                                      ),
                                    ),
                                    Text(
                                      getMessage,
                                      //weatherValues.weatherMain,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: 'Nunito',
                                        color: AppColors.textC,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  // crossAxisAlignment: CrossAxisAlignment.end,
                                  //mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    SizedBox(
                                      width: ((mediaQ.width) -
                                              (mediaQ.width / 3)) -
                                          80,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      // mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              stringTemp,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontFamily: 'Nunito',
                                                color: AppColors.textC,
                                                fontSize: 90,
                                                fontWeight: FontWeight.w300,
                                                fontStyle: FontStyle.normal,
                                              ),
                                            ),
                                            Text(
                                              '°C',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontFamily: 'Nunito',
                                                color: AppColors.textC,
                                                fontSize: 30,
                                                fontWeight: FontWeight.w400,
                                                fontStyle: FontStyle.normal,
                                              ),
                                            ),
                                          ],
                                        ),
                                        // Text(
                                        //   'Temp (feels like) $feelsLikeTemp °C',
                                        //   textAlign: TextAlign.center,
                                        //   style: const TextStyle(
                                        //     fontFamily: 'Nunito',
                                        //     color: primarylight,
                                        //     fontSize: 10,
                                        //     fontWeight: FontWeight.w700,
                                        //     fontStyle: FontStyle.normal,
                                        //   ),
                                        // ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),

                  SizedBox(
                    height: 100,
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              //##
                              Navigator.pushReplacement<void, void>(
                                context,
                                MaterialPageRoute<void>(
                                    builder: (BuildContext context) {
                                  return CategoryDetailsScreen(
                                    targetRouteName: AppRoutes.home,
                                    paraMetrs: "temprature",
                                    checkBldevice: widget.checkBldevice,
                                    checkvalue1:
                                        temprature == "null" ? "0" : temprature,
                                    checkvalue2: "°C",
                                  );
                                }),
                              );
                            },
                            child: Container(
                              height: 100,
                              width: (mediaQ.width / 2) - 26,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                gradient: LinearGradient(
                                    colors: [
                                      AppColors.kPrimaryColor.shade900,
                                      AppColors.cardC,
                                      AppColors.cardC,
                                      AppColors.kPrimaryColor.shade900
                                    ],
                                    begin: FractionalOffset.topRight,
                                    end: FractionalOffset.bottomLeft,
                                    stops: const [0.0, 0.05, 0.85, 1.0],
                                    tileMode: TileMode.decal),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                    color: Colors.black45.withOpacity(0.3),
                                    blurRadius: 2.0,
                                    offset: const Offset(0.1, 0.1),
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 64,
                                      width: 64,
                                      child: Lottie.asset(
                                          'assets/anims/temperature-icon.json'),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          'TEMPRATURE',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: 'Nunito',
                                            color: AppColors.textC,
                                            fontSize: 10,
                                            fontWeight: FontWeight.w600,
                                            fontStyle: FontStyle.normal,
                                          ),
                                        ),
                                        // Row(
                                        //   crossAxisAlignment:
                                        //       CrossAxisAlignment.center,
                                        //   mainAxisAlignment:
                                        //       MainAxisAlignment.end,
                                        //   children: const [
                                        Text(
                                          temprature == "null"
                                              ? "0"
                                              : temprature,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: 'Nunito',
                                            color: AppColors.textC,
                                            fontSize: 40,
                                            fontWeight: FontWeight.w200,
                                            fontStyle: FontStyle.normal,
                                          ),
                                        ),
                                        //   ],
                                        // ),
                                        Text(
                                          '°C',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: 'Nunito',
                                            color: AppColors.textC,
                                            fontSize: 10,
                                            fontWeight: FontWeight.w600,
                                            fontStyle: FontStyle.normal,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              //##
                              Navigator.pushReplacement<void, void>(
                                context,
                                MaterialPageRoute<void>(
                                    builder: (BuildContext context) {
                                  return CategoryDetailsScreen(
                                    targetRouteName: AppRoutes.home,
                                    paraMetrs: "heartbeat",
                                    checkBldevice: widget.checkBldevice,
                                    checkvalue1:
                                        heartrate == "null" ? "0" : heartrate,
                                    checkvalue2: "bpm",
                                  );
                                }),
                              );
                            },
                            child: Container(
                              height: 100,
                              width: (mediaQ.width / 2) - 26,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                gradient: LinearGradient(
                                    colors: [
                                      AppColors.kPrimaryColor.shade900,
                                      AppColors.cardC,
                                      AppColors.cardC,
                                      AppColors.kPrimaryColor.shade900
                                    ],
                                    begin: FractionalOffset.topRight,
                                    end: FractionalOffset.bottomLeft,
                                    stops: const [0.0, 0.15, 0.95, 1.0],
                                    tileMode: TileMode.decal),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                    color: Colors.black45.withOpacity(0.3),
                                    blurRadius: 2.0,
                                    offset: const Offset(0.1, 0.1),
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 64,
                                      width: 64,
                                      child: Lottie.asset(
                                          'assets/anims/teal-healthy-heart.json'),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          'HEART BEAT',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: 'Nunito',
                                            color: AppColors.textC,
                                            fontSize: 10,
                                            fontWeight: FontWeight.w600,
                                            fontStyle: FontStyle.normal,
                                          ),
                                        ),
                                        // Row(
                                        //   crossAxisAlignment:
                                        //       CrossAxisAlignment.center,
                                        //   mainAxisAlignment:
                                        //       MainAxisAlignment.end,
                                        //   children: const [
                                        Text(
                                          heartrate == "null" ? "0" : heartrate,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: 'Nunito',
                                            color: AppColors.textC,
                                            fontSize: 40,
                                            fontWeight: FontWeight.w200,
                                            fontStyle: FontStyle.normal,
                                          ),
                                        ),
                                        //   ],
                                        // ),
                                        Text(
                                          'bpm',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: 'Nunito',
                                            color: AppColors.textC,
                                            fontSize: 10,
                                            fontWeight: FontWeight.w600,
                                            fontStyle: FontStyle.normal,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          // Text(
                          //   usrData.user.username,
                          //   textAlign: TextAlign.center,
                          //   style: const TextStyle(
                          //     fontFamily: 'Nunito',
                          //     color: primarydark,
                          //     fontSize: 30,
                          //     fontWeight: FontWeight.w900,
                          //     fontStyle: FontStyle.normal,
                          //   ),
                          // ),
                        ]),
                  ),

                  const SizedBox(
                    height: 5,
                  ),
//####################################################
                  SizedBox(
                    height: 100,
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              //##
                              Navigator.pushReplacement<void, void>(
                                context,
                                MaterialPageRoute<void>(
                                    builder: (BuildContext context) {
                                  return CategoryDetailsScreen(
                                    targetRouteName: AppRoutes.home,
                                    paraMetrs: "babykicks",
                                    checkBldevice: widget.checkBldevice,
                                    checkvalue1:
                                        babykicks == "null" ? "0" : babykicks,
                                    checkvalue2: "kpm",
                                  );
                                }),
                              );
                            },
                            child: Container(
                              height: 100,
                              width: (mediaQ.width / 2) - 26,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                gradient: LinearGradient(
                                    colors: [
                                      AppColors.kPrimaryColor.shade900,
                                      AppColors.cardC,
                                      AppColors.cardC,
                                      AppColors.kPrimaryColor.shade900
                                    ],
                                    begin: FractionalOffset.topRight,
                                    end: FractionalOffset.bottomLeft,
                                    stops: [0.0, 0.05, 0.85, 1.0],
                                    tileMode: TileMode.decal),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                    color: Colors.black45.withOpacity(0.3),
                                    blurRadius: 2.0,
                                    offset: const Offset(0.1, 0.1),
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 64,
                                      width: 64,
                                      child: Lottie.asset(
                                          'assets/anims/animated-baby.json'),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          'BABY KICKS',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: 'Nunito',
                                            color: AppColors.textC,
                                            fontSize: 10,
                                            fontWeight: FontWeight.w600,
                                            fontStyle: FontStyle.normal,
                                          ),
                                        ),
                                        // Row(
                                        //   crossAxisAlignment:
                                        //       CrossAxisAlignment.center,
                                        //   mainAxisAlignment:
                                        //       MainAxisAlignment.end,
                                        //   children: const [
                                        Text(
                                          babykicks == "null" ? "0" : babykicks,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: 'Nunito',
                                            color: AppColors.textC,
                                            fontSize: 40,
                                            fontWeight: FontWeight.w200,
                                            fontStyle: FontStyle.normal,
                                          ),
                                        ),
                                        //   ],
                                        // ),
                                        Text(
                                          'kpm',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: 'Nunito',
                                            color: AppColors.textC,
                                            fontSize: 10,
                                            fontWeight: FontWeight.w600,
                                            fontStyle: FontStyle.normal,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              //##
                              Navigator.pushReplacement<void, void>(
                                context,
                                MaterialPageRoute<void>(
                                    builder: (BuildContext context) {
                                  return CategoryDetailsScreen(
                                    targetRouteName: AppRoutes.home,
                                    paraMetrs: "saturation",
                                    checkBldevice: widget.checkBldevice,
                                    checkvalue1:
                                        saturation == "null" ? "0" : saturation,
                                    checkvalue2: "sp02",
                                  );
                                }),
                              );
                            },
                            child: Container(
                              height: 100,
                              width: (mediaQ.width / 2) - 26,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                gradient: LinearGradient(
                                    colors: [
                                      AppColors.kPrimaryColor.shade900,
                                      AppColors.cardC,
                                      AppColors.cardC,
                                      AppColors.kPrimaryColor.shade900
                                    ],
                                    begin: FractionalOffset.topRight,
                                    end: FractionalOffset.bottomLeft,
                                    stops: [0.0, 0.15, 0.95, 1.0],
                                    tileMode: TileMode.decal),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                    color: Colors.black45.withOpacity(0.3),
                                    blurRadius: 2.0,
                                    offset: const Offset(0.1, 0.1),
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 64,
                                      width: 64,
                                      child: Lottie.asset(
                                          'assets/anims/oxygen-saturation.json'),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          'SATURATION',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: 'Nunito',
                                            color: AppColors.textC,
                                            fontSize: 10,
                                            fontWeight: FontWeight.w600,
                                            fontStyle: FontStyle.normal,
                                          ),
                                        ),
                                        // Row(
                                        //   crossAxisAlignment:
                                        //       CrossAxisAlignment.center,
                                        //   mainAxisAlignment:
                                        //       MainAxisAlignment.end,
                                        //   children: const [
                                        Text(
                                          saturation == "null"
                                              ? "0"
                                              : saturation,
                                          textAlign: TextAlign.center,
                                          style:  TextStyle(
                                            fontFamily: 'Nunito',
                                            color:AppColors.textC,
                                            fontSize: 40,
                                            fontWeight: FontWeight.w200,
                                            fontStyle: FontStyle.normal,
                                          ),
                                        ),
                                        //   ],
                                        // ),
                                         Text(
                                          'sp02',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: 'Nunito',
                                            color: AppColors.textC,
                                            fontSize: 10,
                                            fontWeight: FontWeight.w600,
                                            fontStyle: FontStyle.normal,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          // Text(
                          //   usrData.user.username,
                          //   textAlign: TextAlign.center,
                          //   style: const TextStyle(
                          //     fontFamily: 'Nunito',
                          //     color: primarydark,
                          //     fontSize: 30,
                          //     fontWeight: FontWeight.w900,
                          //     fontStyle: FontStyle.normal,
                          //   ),
                          // ),
                        ]),
                  ),

                  const SizedBox(
                    height: 5,
                  ),
//####################################################
                  SizedBox(
                    height: 100,
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              //##
                              Navigator.pushReplacement<void, void>(
                                context,
                                MaterialPageRoute<void>(
                                    builder: (BuildContext context) {
                                  return CategoryDetailsScreen(
                                    targetRouteName: AppRoutes.home,
                                    paraMetrs: "water",
                                    checkBldevice: widget.checkBldevice,
                                    checkvalue1: water == "null" ? "0" : water,
                                    checkvalue2: "ml",
                                  );
                                }),
                              );
                            },
                            child: Container(
                              height: 100,
                              width: (mediaQ.width / 2) - 26,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                gradient: LinearGradient(
                                    colors: [
                                      AppColors.kPrimaryColor.shade900,
                                      AppColors.cardC,
                                      AppColors.cardC,
                                      AppColors.kPrimaryColor.shade900
                                    ],
                                    begin: FractionalOffset.topRight,
                                    end: FractionalOffset.bottomLeft,
                                    stops: [0.0, 0.05, 0.85, 1.0],
                                    tileMode: TileMode.decal),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                    color: Colors.black45.withOpacity(0.3),
                                    blurRadius: 2.0,
                                    offset: const Offset(0.1, 0.1),
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 64,
                                      width: 64,
                                      child: Lottie.asset(
                                          'assets/anims/glass-water.json'),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          'WATER',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: 'Nunito',
                                            color: AppColors.textC,
                                            fontSize: 10,
                                            fontWeight: FontWeight.w600,
                                            fontStyle: FontStyle.normal,
                                          ),
                                        ),
                                        // Row(
                                        //   crossAxisAlignment:
                                        //       CrossAxisAlignment.center,
                                        //   mainAxisAlignment:
                                        //       MainAxisAlignment.end,
                                        //   children: const [
                                        Text(
                                          water == "null" ? "0" : water,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: 'Nunito',
                                            color: AppColors.textC,
                                            fontSize: 40,
                                            fontWeight: FontWeight.w200,
                                            fontStyle: FontStyle.normal,
                                          ),
                                        ),
                                        //   ],
                                        // ),
                                         Text(
                                          'ml',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: 'Nunito',
                                            color: AppColors.textC,
                                            fontSize: 10,
                                            fontWeight: FontWeight.w600,
                                            fontStyle: FontStyle.normal,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              //##
                              Navigator.pushReplacement<void, void>(
                                context,
                                MaterialPageRoute<void>(
                                    builder: (BuildContext context) {
                                  return CategoryDetailsScreen(
                                    targetRouteName: AppRoutes.home,
                                    paraMetrs: "exercise",
                                    checkBldevice: widget.checkBldevice,
                                    checkvalue1: steps == "null" ? "0" : steps,
                                    checkvalue2: "steps",
                                  );
                                }),
                              );
                            },
                            child: Container(
                              height: 100,
                              width: (mediaQ.width / 2) - 26,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                gradient: LinearGradient(
                                    colors: [
                                      AppColors.kPrimaryColor.shade900,
                                      AppColors.cardC,
                                      AppColors.cardC,
                                      AppColors.kPrimaryColor.shade900
                                    ],
                                    begin: FractionalOffset.topRight,
                                    end: FractionalOffset.bottomLeft,
                                    stops: [0.0, 0.15, 0.95, 1.0],
                                    tileMode: TileMode.decal),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                    color: Colors.black45.withOpacity(0.3),
                                    blurRadius: 2.0,
                                    offset: const Offset(0.1, 0.1),
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 64,
                                      width: 64,
                                      child: Lottie.asset(
                                          'assets/anims/dumbbell.json'),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                         Text(
                                          'EXERCISE',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: 'Nunito',
                                            color: AppColors.textC,
                                            fontSize: 10,
                                            fontWeight: FontWeight.w600,
                                            fontStyle: FontStyle.normal,
                                          ),
                                        ),
                                        // Row(
                                        //   crossAxisAlignment:
                                        //       CrossAxisAlignment.center,
                                        //   mainAxisAlignment:
                                        //       MainAxisAlignment.end,
                                        //   children: const [
                                        Text(
                                          steps == "null" ? "0" : steps,
                                          textAlign: TextAlign.center,
                                          style:  TextStyle(
                                            fontFamily: 'Nunito',
                                            color: AppColors.textC,
                                            fontSize: 40,
                                            fontWeight: FontWeight.w200,
                                            fontStyle: FontStyle.normal,
                                          ),
                                        ),
                                        //   ],
                                        // ),
                                         Text(
                                          'steps',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: 'Nunito',
                                            color: AppColors.textC,
                                            fontSize: 10,
                                            fontWeight: FontWeight.w600,
                                            fontStyle: FontStyle.normal,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          // Text(
                          //   usrData.user.username,
                          //   textAlign: TextAlign.center,
                          //   style: const TextStyle(
                          //     fontFamily: 'Nunito',
                          //     color: primarydark,
                          //     fontSize: 30,
                          //     fontWeight: FontWeight.w900,
                          //     fontStyle: FontStyle.normal,
                          //   ),
                          // ),
                        ]),
                  ),
                ]),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () async {
                var status = await Permission.bluetoothConnect.status;
                if (status.isDenied || status.isPermanentlyDenied) {
                  await Permission.bluetoothConnect.request().then((value) {
                    if (value.isDenied || value.isPermanentlyDenied) {
                      scaffoldNotifier(context, mediaQ, 'Failed to access bluetooth, please retry here', "warning", 1800);
                    } else if (value.isGranted) {
                      Navigator.pushReplacement<void, void>(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) =>
                              const FlutterBlueApp(
                                  targetRouteName: AppRoutes.home),
                        ),
                      );
                    } else {
                      scaffoldNotifier(context, mediaQ, 'Sorry!, failed to access bluetooth.', "error", 1800);
                    }
                  });
                } else {
                  Navigator.pushReplacement<void, void>(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) =>
                          const FlutterBlueApp(targetRouteName: AppRoutes.home),
                    ),
                  );
                }
              },
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 32.0, right: 32.0, bottom: 16.0),
                child: Container(
                    alignment: Alignment.bottomCenter,
                    height: 50,
                    width: mediaQ.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppColors.kPrimaryColor.shade500,
                    ),
                    child: Center(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Connect Device',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              fontFamily: 'Nunito',
                              color: AppColors.kPrimaryColor.shade50,
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Icon(
                            bluetooth,
                            color: AppColors.kPrimaryColor.shade50,
                          )
                        ],
                      ),
                    )),
              ),
            )
          ],
        )
      ]),
    );
  }

  @override
  void dispose() {
    //_blocForm.close();
    // weatherValues.;
    // _timer.cancel();
    // _timerTwo.cancel();
    super.dispose();
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

}

// class TextWiget extends StatelessWidget {
//   const TextWiget({
//     Key key,
//   }) : super(key: key);

//   Stream<HealthData> data() async*{
//    pstHealthData.getServerData();
//   }

//   @override
//   Widget build(BuildContext context) async{
//     return StreamBuilder<HealthData> (
//         stream: await pstHealthData.getServerData(),
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             //snapshot.data.attributes.userId.allMatches((element) => element.Url == "your URL link")
//             //for (var i = snapshot.data.attributes.userId; i == guser.user.id; )
//             Center(
//                 child:
//                     //Text(snapshot.data.body)
//                     Text(
//               snapshot.data.attributes.temprature,
//               textAlign: TextAlign.center,
//               style: const TextStyle(
//                 fontFamily: 'Nunito',
//                 color: primarylight,
//                 fontSize: 40,
//                 fontWeight: FontWeight.w200,
//                 fontStyle: FontStyle.normal,
//               ),
//             ));
//           } else {
//             const CircularProgressIndicator();
//           }
//         });
//   }
// }

class TopsCurve extends CustomClipper<Path> {
  //TopsCurve(Size mediaQ);

  @override
  Path getClip(Size size) {
    Path path = Path();
    final double _xScaling = size.width / 428;
    final double _yScaling = size.height / 331;
    path.lineTo(428 * _xScaling, 0 * _yScaling);
    path.cubicTo(
      428 * _xScaling,
      0 * _yScaling,
      0 * _xScaling,
      0 * _yScaling,
      0 * _xScaling,
      0 * _yScaling,
    );
    path.cubicTo(
      0 * _xScaling,
      0 * _yScaling,
      0 * _xScaling,
      236.637 * _yScaling,
      0 * _xScaling,
      236.637 * _yScaling,
    );
    path.cubicTo(
      0 * _xScaling,
      236.637 * _yScaling,
      428 * _xScaling,
      330.788 * _yScaling,
      428 * _xScaling,
      330.788 * _yScaling,
    );
    path.cubicTo(
      428 * _xScaling,
      330.788 * _yScaling,
      428 * _xScaling,
      0 * _yScaling,
      428 * _xScaling,
      0 * _yScaling,
    );
    path.cubicTo(
      428 * _xScaling,
      0 * _yScaling,
      428 * _xScaling,
      0 * _yScaling,
      428 * _xScaling,
      0 * _yScaling,
    );
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}

import 'dart:io';

import 'package:enclampsia/providers/dip.dart';
import 'package:enclampsia/providers/gp.dart';
import 'package:enclampsia/providers/usp.dart';
import 'package:enclampsia/utils/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../config/routes.dart';
import '../models/contentmodels/modelcarenc.dart';
import '../models/contentmodels/preeclampsiauser.dart';
import '../models/contentmodels/preeclamsier.dart';
import '../models/contentmodels/usersettings/preeclampsiausersettings.dart';
import '../repositories/authrepository.dart';
import '../repositories/preeclamsiausersettingsrepo.dart';

final authNewProvider = Provider(AuthProvider.new);

class AuthProvider {
  AuthProvider(
    this.ref, {
    int? Function()? getCurrentTimestamp,
  }) : getCurrentTimestamp = getCurrentTimestamp ??
            (() => DateTime.now().millisecondsSinceEpoch);
  //SharedPreferences? sharedPreferences;
  int? Function()? getCurrentTimestamp;
  final Ref? ref;

  Preeclampsier? user;
  final registrationProvider =
      FutureProvider.family<String, Ustore>((ref, val) async {
    final repository = ref.watch(authRepositoryProvider);
    PrenclampsiaUser responce = await repository.register(val);
    if (kDebugMode) {
      print("resp------ $responce");
    }
    String resp = responce.jwt != null
        ? "registered"
        : responce.errorz?.message != null
            ? "not-registered"
            : "error";
    Position pos = await ref.watch(determinePosition.future);
    Placemark placemark = await ref.watch(getGeoCodingFromPos(pos).future);
    Map<String, dynamic> troveUserSettings = PreEclampsiaUserSettings(
      theme: isDarkMode ? "3" : "0",
      notifications: "3",
      termsagreement: "1",
      longitude: pos.longitude.toString(),
      latitude: pos.latitude.toString(),
      city: placemark.name,
      country: placemark.country,
      state: placemark.locality,
      countrycode: placemark.isoCountryCode,
      tax: "16.0",
      userid: responce.user!.id,
    ).toJson();

    await ref.watch(createUserSettingsProvider(troveUserSettings).future);
    await ref.watch(postGeolocationData.future);
    //
    //
    //value.jwt != null && value.user.email != null
    if (kDebugMode) {
      print("resp 4r------ $resp");
    }
    return resp;
  });

  final loginProvider = FutureProvider.family<String, Ustore>((ref, val) async {
    final repository = ref.watch(authRepositoryProvider);
    final usersetsrepository = ref.watch(userSettingsRepositoryProvider);

    PrenclampsiaUser responce = await repository.login(val);
    if (kDebugMode) {
      print("resp------ $responce");
    }
    String resp = responce.jwt != null
        ? "authenticated"
        : responce.errorz?.message != null
            ? "not-authenticated"
            : "error";
    await ref.watch(postGeolocationData.future);
    final ur = await ref.watch(getUserSettingsProvider.future);
    if (kDebugMode) {
      print("gooten from net--- $ur");
    }
    PreEclampsiaUserSettings? troveUserSettings =
        await usersetsrepository.getCurrentUserSettings();
        if (kDebugMode) {
      print("gooten from locally--- $troveUserSettings");
    }
    if (troveUserSettings!.appUsage == "11" ||
        troveUserSettings.appUsage == "22") {
      Platform.isAndroid
          ? await ref.watch(postAndroidDeviceData.future)
          : Platform.isIOS
              ? ref.watch(postIosDeviceData.future)
              : null;
    } else {
      Platform.isAndroid
          ? await ref.watch(postAndroidDeviceData.future)
          : Platform.isIOS
              ? ref.watch(postIosDeviceData.future)
              : null;
    }
    //value.jwt != null && value.user.email != null
    if (kDebugMode) {
      print("resp 4r------ $resp");
    }
    return resp;
  });
}

final TextEditingController passwordController = TextEditingController();
final TextEditingController emailController = TextEditingController();
final TextEditingController usernameController = TextEditingController();
final counterProvider = StateProvider.autoDispose((ref) => 0);
final loaderProvider = StateProvider.autoDispose((ref) => 0);
final emailerrorProvider = StateProvider.autoDispose((ref) => 0);
final passerrorProvider = StateProvider.autoDispose((ref) => 0);
final pageProvider = StateProvider.autoDispose((ref) => 0);

final controllerProvider = StateProvider((ref) => passwordController);
final emailControllerProvider = StateProvider((ref) => emailController);
final usernameControllerProvider = StateProvider((ref) => usernameController);

final userStoreProvider = FutureProvider.family<String, Uval>((ref, val) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  if (val.one == "one") {
    await sharedPreferences.setString('memval', val.two!);
  }
  if (val.one == "two") {
    await sharedPreferences.setString('email', val.three!);
    await sharedPreferences.setString('pass', val.four!);
  } else if (val.one == "three") {
    var len = val.seven!.length;
    await sharedPreferences.setString('fname', val.five!);
    await sharedPreferences.setString('lname', val.six!);
    await sharedPreferences.setString('uname', val.seven!.substring(1, len));
  }
  return sharedPreferences.getString("memval")!;
});

final storedUserData = FutureProvider((ref) async {
  await Future<void>.delayed(const Duration(milliseconds: 250));
  final repository = ref.watch(authRepositoryProvider);
  String uuidStr = uuidString;
  String uStr = xoxValue;
  if (kDebugMode) {
    print("#####---------GenKeys Start--------######");
    print(uuidStr);
    print("mentor: $xzxValue");
    print("user: $uStr");
    print("#####---------GenKeys End--------######");
  }
  final userData = repository.getCurrentUser();
  return userData;
});

final notifierUserData =
    Provider.family.autoDispose<Future<PrenclampsiaUser?>, Dunt?>((ref, data) async {

  PrenclampsiaUser? usr;
  await Future<void>.delayed(const Duration(milliseconds: 7000))
      .then((t) async {
    final repository = ref.watch(authRepositoryProvider);
    //final repository = ref.watch(authRepositoryProvider);
    final userData = await repository.getCurrentUser();
    if (userData?.jwt == null && userData?.user?.email == null) {
      if (kDebugMode) {
        print("redirecting to login");
      }
      Navigator.of(data!.one!)
          .pushNamedAndRemoveUntil(Routes.login, (route) => false);
    } else {
      final usersetsrepository = ref.watch(userSettingsRepositoryProvider);
    final ur = await ref.watch(getUserSettingsProvider.future);
    if (kDebugMode) {
      print("gooten from net--- ${ur.onboadingScreen}");
    }
    PreEclampsiaUserSettings? troveUserSettings =
        await usersetsrepository.getCurrentUserSettings();
        if (kDebugMode) {
      print("Onboading from locally--- ${troveUserSettings?.onboadingScreen}.");
    }
      if (kDebugMode) {
        print("redirecting to home");
      }
      await ref.watch(postGeolocationData.future);
      if(troveUserSettings!.categoriesdata != null) {
        Navigator.of(data!.one!)
          .pushNamedAndRemoveUntil(Routes.homepage, (route) => false);
      }  else{
        Navigator.of(data!.one!)
          .pushNamedAndRemoveUntil(Routes.onboarding, (route) => false);
      }     
      
    }
    usr = userData;
    return "nil";
  }).onError((error, stackTrace) {
    return stackTrace.toString();
  });
  if (kDebugMode) {
    print("authProver Wached---$usr");
  }
  return usr;
});

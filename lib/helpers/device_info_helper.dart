import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';

DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

Future<AndroidDeviceInfo> androidDeviceInfo() async {
  AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
  if (kDebugMode) {
    print('Running on ${androidInfo.model}');
  }
  return androidInfo;
}

///api/userdevices
///api/usersettings

Future<Map<String, dynamic>?> buildBaseDeviceInfo() async {
  final deviceInfosat = await deviceInfo.deviceInfo;
  final map = deviceInfosat.toMap();
  if (kDebugMode) {
    print('Running on $map');
  }
  return map;
}

Future<IosDeviceInfo> iosDeviceInfo() async {
  IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
  if (kDebugMode) {
    print('Running on ${iosInfo.utsname.machine}');
  }
  return iosInfo;
}

Future<WebBrowserInfo> webBrowserDInfo() async {
  WebBrowserInfo webBrowserInfo = await deviceInfo.webBrowserInfo;
  if (kDebugMode) {
    print('Running on ${webBrowserInfo.userAgent}');
  }
  return webBrowserInfo;
}

import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import '../models/devicemodels/android_device_data_model.dart';
import '../models/devicemodels/ios_device_data_model.dart';

final troveUsrDeviceInfRepositoryProvider =
    Provider(TroveUsrDeviceInfRepository.new);

class TroveUsrDeviceInfRepository {
  TroveUsrDeviceInfRepository(
    this.ref, {
    int? Function()? getCurrentTimestamp,
  }) : getCurrentTimestamp = getCurrentTimestamp ??
            (() => DateTime.now().millisecondsSinceEpoch);
  //SharedPreferences? sharedPreferences;
  final Ref? ref;
  int? Function()? getCurrentTimestamp;

  Future<PreEclampsiaUsrAndroidDeviceInfo?> androidDvcUsrtTroveUsrPosData(
      Map<String, dynamic> pos, String? jwt) async {
    final envval = dotenv.env['API_ENDPOINT'];
    //final String url = '${GlobalConfiguration().getString('api_base_url')}login';
    final String url = '${envval.toString()}api/userdevices';
    final client = http.Client();
    if (kDebugMode) {
      print(url);
    }
    final response = await client.post(
      Uri.parse(url),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $jwt',
      },
      body: json.encode({"data":pos}),
    );
    if (kDebugMode) {
      print(response.body);
    }
    PreEclampsiaUsrAndroidDeviceInfo? troveUsrDeviceInf;
    if (response.statusCode == 200) {
      troveUsrDeviceInf =
          PreEclampsiaUsrAndroidDeviceInfo.fromMap(json.decode(response.body));
    } else if (response.statusCode == 400) {
      //setCurrentUser(response.body);
      troveUsrDeviceInf =
          PreEclampsiaUsrAndroidDeviceInfo.fromMap(json.decode(response.body));
    } else {
      throw Exception(response.body);
    }
    return troveUsrDeviceInf;
  }

  Future<PreEclampsiaUsrIosDeviceInfo?> iosDvcUsrtTroveUsrPosData(
      Map<String, dynamic> pos, String? jwt) async {
    final envval = dotenv.env['API_ENDPOINT'];
    //final String url = '${GlobalConfiguration().getString('api_base_url')}login';
    final String url = '${envval.toString()}api/userdevices';
    final client = http.Client();
    if (kDebugMode) {
      print(url);
    }
    final response = await client.post(
      Uri.parse(url),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $jwt',
      },
      body: json.encode({"data":pos}),
    );
    if (kDebugMode) {
      print(response.body);
    }
    PreEclampsiaUsrIosDeviceInfo? troveUsrDeviceInf;
    if (response.statusCode == 200) {
      troveUsrDeviceInf =
          PreEclampsiaUsrIosDeviceInfo.fromMap(json.decode(response.body));
    } else if (response.statusCode == 400) {
      //setCurrentUser(response.body);
      troveUsrDeviceInf =
          PreEclampsiaUsrIosDeviceInfo.fromMap(json.decode(response.body));
    } else {
      throw Exception(response.body);
    }
    return troveUsrDeviceInf;
  }
}

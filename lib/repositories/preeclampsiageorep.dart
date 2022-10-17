import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator_android/geolocator_android.dart';
import 'package:geolocator_apple/geolocator_apple.dart';

import '../models/contentmodels/positionmodel/preeclampsiaposition.dart';


final preeclampsiaUsrPosRepositoryProvider = Provider(PreEclampsiaUsrPosRepository.new);

class PreEclampsiaUsrPosRepository {
  PreEclampsiaUsrPosRepository(
    this.ref, {
    int? Function()? getCurrentTimestamp,
  }) : getCurrentTimestamp = getCurrentTimestamp ??
            (() => DateTime.now().millisecondsSinceEpoch);
  //SharedPreferences? sharedPreferences;
  final Ref? ref;
  int? Function()? getCurrentTimestamp;

  Future<String> registerGeolocator() async {
    String? responce;
    if (Platform.isAndroid) {
      GeolocatorAndroid.registerWith();
      responce = "androidReg";
    } else if (Platform.isIOS) {
      GeolocatorApple.registerWith();
      responce = "iosReg";
    }
    return responce!;
  }

  Future<PreEclampsiaUsrPosition?> postTroveUsrPosData(
      Map<String, dynamic> pos, String? jwt) async {
    final envval = dotenv.env['API_ENDPOINT'];
    //final String url = '${GlobalConfiguration().getString('api_base_url')}login';
    final String url = '${envval.toString()}api/locations';
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
      body:json.encode({"data":pos}),
    );
    if (kDebugMode) {
      print(response.body);
    }
    PreEclampsiaUsrPosition? troveUsrPosition;
    if (response.statusCode == 200) {
      troveUsrPosition = PreEclampsiaUsrPosition.fromMap(json.decode(response.body)['data']['attributes']);
    } else if (response.statusCode == 400) {
      //setCurrentUser(response.body);
      troveUsrPosition = PreEclampsiaUsrPosition.fromMap(json.decode(response.body)['data']['attributes']);
    } else {
      throw Exception(response.body);
    }
    return troveUsrPosition;
  }
}

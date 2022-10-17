import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/contentmodels/usersettings/preeclampsiausersettings.dart';

final userSettingsRepositoryProvider = Provider(UserSettingsRepository.new);

class UserSettingsRepository {
  UserSettingsRepository(
    this.ref, {
    int? Function()? getCurrentTimestamp,
  }) : getCurrentTimestamp = getCurrentTimestamp ??
            (() => DateTime.now().millisecondsSinceEpoch);
  //SharedPreferences? sharedPreferences;
  final Ref? ref;
  int? Function()? getCurrentTimestamp;
  ValueNotifier<PreEclampsiaUserSettings>? currentUserSettings =
      ValueNotifier(PreEclampsiaUserSettings());
  //api/usersettingsgetter/

  Future<PreEclampsiaUserSettings> postUserSettings(
      Map<String, dynamic> data, String? jwt) async {
    final envval = dotenv.env['API_ENDPOINT'];
    //final String url = '${GlobalConfiguration().getString('api_base_url')}login';
    final String url = '${envval.toString()}api/usersettingsgetter';
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
      body: json.encode({"data":data}),
    );
    if (kDebugMode) {
      print(response.body);
    }
    if (response.statusCode == 200) {
      setCurrentUserSettings(response.body);
      currentUserSettings!.value =
          PreEclampsiaUserSettings.fromJson(json.decode(response.body)['data']);
    } else if (response.statusCode == 400) {
      //setCurrentUser(response.body);
      currentUserSettings!.value =
          PreEclampsiaUserSettings.fromJson(json.decode(response.body)['data']);
    } else {
      throw Exception(response.body);
    }
    return currentUserSettings!.value;
  }

  Future<PreEclampsiaUserSettings> getUserSettings(String? jwt, String? uid) async {
    final envval = dotenv.env['API_ENDPOINT'];
    //final String url = '${GlobalConfiguration().getString('api_base_url')}login';
    final String url = '${envval.toString()}api/usersettingsgetter/$uid';
    final client = http.Client();
    if (kDebugMode) {
      print(url);
    }
    final response = await client.get(
      Uri.parse(url),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $jwt',
      },
    );
    if (kDebugMode) {
      print("responce from net ===${response.body}");
    }
    if (response.statusCode == 200) {
      setCurrentUserSettings(response.body);
      currentUserSettings!.value =
          PreEclampsiaUserSettings.fromJson(json.decode(response.body));
    } else if (response.statusCode == 400) {
      //setCurrentUser(response.body);
      currentUserSettings!.value =
          PreEclampsiaUserSettings.fromJson(json.decode(response.body));
    } else {
      throw Exception(response.body);
    }
    return currentUserSettings!.value;
  }

  Future<PreEclampsiaUserSettings> updateUserSettings(
      List data, String? jwt, String? uid) async {
    final envval = dotenv.env['API_ENDPOINT'];
    //final String url = '${GlobalConfiguration().getString('api_base_url')}login';
    final String url = '${envval.toString()}api/usersettingsgetter/me';
    final client = http.Client();
    if (kDebugMode) {
      print(url);
    }
    final response = await client.put(
      Uri.parse(url),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $jwt',
      },
      body: //categoriesdata
        data[0] == "appUsage"?
        json.encode({"app_usage":data[1]}):
       data[0] == "categories"? 
       json.encode({
        "onboading_screen":1,
        "categoriesdata": data[1]
       })
       :json.encode({"app_usage":1})
    );
    if (kDebugMode) {
      print(response.body);
    }
    if (response.statusCode == 200) {
      setCurrentUserSettings(response.body);
      currentUserSettings!.value =
          PreEclampsiaUserSettings.fromJson(json.decode(response.body));
    } else if (response.statusCode == 400) {
      //setCurrentUser(response.body);
      currentUserSettings!.value =
          PreEclampsiaUserSettings.fromJson(json.decode(response.body));
    } else {
      throw Exception(response.body);
    }
    return currentUserSettings!.value;
  }

  void setCurrentUserSettings(jsonString) async {
    try {
      if (json.decode(jsonString) != null) {
        SharedPreferences? prefs = await SharedPreferences.getInstance();
        await prefs.setString(
            'current_usersettings', json.encode(json.decode(jsonString)));
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      throw Exception(e);
    }
  }

  Future<PreEclampsiaUserSettings?> getCurrentUserSettings() async {
    SharedPreferences? prefs = await SharedPreferences.getInstance();
    //prefs.clear();
    if (prefs.containsKey('current_usersettings')) {
      if (kDebugMode) {
        print('got - usersettings');
      }
      currentUserSettings?.value = PreEclampsiaUserSettings.fromJson(
          json.decode(prefs.get('current_usersettings').toString()));
    } else {
      if (kDebugMode) {
        print('got - none');
      }
    }
    // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
    currentUserSettings!.notifyListeners();
    return currentUserSettings!.value;
  }
}

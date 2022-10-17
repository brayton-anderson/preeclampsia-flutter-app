import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../models/contentmodels/modelcarenc.dart';
import '../models/contentmodels/preeclampsiauser.dart';
import '../models/contentmodels/preeclamsier.dart';

final authRepositoryProvider = Provider(AuthRepository.new);

class AuthRepository {
  AuthRepository(
    this.ref, {
    int? Function()? getCurrentTimestamp,
  }) : getCurrentTimestamp = getCurrentTimestamp ??
            (() => DateTime.now().millisecondsSinceEpoch);
  //SharedPreferences? sharedPreferences;
  final Ref? ref;
  int? Function()? getCurrentTimestamp;
  ValueNotifier<PrenclampsiaUser>? currentUser = ValueNotifier(PrenclampsiaUser());
//ValueNotifier<UserErrors> currentError = ValueNotifier(UserErrors());
  ValueNotifier<bool>? isloggedin = ValueNotifier(false);

  Future<PrenclampsiaUser> login(Ustore? ustore) async {
    final envval = dotenv.env['API_ENDPOINT'];
    //final String url = '${GlobalConfiguration().getString('api_base_url')}login';
    final String url = '${envval.toString()}api/auth/local';
    final client = http.Client();
    if (kDebugMode) {
      print(url);
      print(ustore!.email);
    }
    final response = await client.post(
      Uri.parse(url),
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
      body: json.encode({"identifier": ustore!.email, "password": ustore.pass}),
    );
    if (kDebugMode) {
      print(response.body);
    }
    if (response.statusCode == 200) {
      setCurrentUser(response.body);
      currentUser!.value = PrenclampsiaUser.fromJson(json.decode(response.body));
    } else if (response.statusCode == 400) {
      //setCurrentUser(response.body);
      currentUser!.value = PrenclampsiaUser.fromJson(json.decode(response.body));
    } else {
      throw Exception(response.body);
    }
    return currentUser!.value;
  }

  Future<PrenclampsiaUser> register(Ustore? ustore) async {
    final envval = dotenv.env['API_ENDPOINT'];
    if (kDebugMode) {
      print("from-repo ${ustore!.uname}");
    }
    //final String url = '${GlobalConfiguration().getString('api_base_url')}login';
    final String url = '${envval.toString()}api/auth/local/register';
    final client = http.Client();
    final response = await client.post(
      Uri.parse(url),
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
      body: json.encode({
        "username": ustore!.uname,
        "email": ustore.email,
        "password": ustore.pass,
      }),
    );
    if (kDebugMode) {
      print(response.body);
    }
    if (response.statusCode == 200) {
      setCurrentUser(response.body);
      currentUser?.value = PrenclampsiaUser.fromJson(json.decode(response.body));
    } else if (response.statusCode == 400) {
      //setCurrentUser(response.body);
      currentUser?.value = PrenclampsiaUser.fromJson(json.decode(response.body));
    } else {
      //print(e);
      throw Exception(response.body);
    }
    return currentUser!.value;
  }

  Future<bool?> resetPassword(String? email) async {
    final envval = dotenv.env['API_ENDPOINT'];
    //final String url = '${GlobalConfiguration().getString('api_base_url')}login';
    final String url = '${envval.toString()}api/auth/forgot-password';
    final client = http.Client();
    final response = await client.post(
      Uri.parse(url),
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
      body: json.encode({"email": email}),
    );
    if (response.statusCode == 200) {
      return true;
    } else if (response.statusCode == 400) {
      //setCurrentUser(response.body);
      return false;
    } else {
      //print(CustomTrace(StackTrace.current, message: response.body).toString());
      throw Exception(response.body);
    }
  }

  Future<void> logout() async {
    currentUser!.value = PrenclampsiaUser();
    isloggedin?.value = false;
    SharedPreferences? prefs = await SharedPreferences.getInstance();
    await prefs.remove('current_user');
    await prefs.remove('is_logged');
  }

  void setCurrentUser(jsonString) async {
    try {
      if (json.decode(jsonString) != null) {
        SharedPreferences? prefs = await SharedPreferences.getInstance();
        await prefs.setString(
            'current_user', json.encode(json.decode(jsonString)));
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      throw Exception(e);
    }
  }

  void setIsLoggedIn(value) async {
    try {
      if (value) {
        SharedPreferences? prefs = await SharedPreferences.getInstance();
        await prefs.setBool('is_logged', true);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      throw Exception(e);
    }
  }

  Future<PrenclampsiaUser?> getCurrentUser() async {
    SharedPreferences? prefs = await SharedPreferences.getInstance();
    //prefs.clear();
    if (prefs.containsKey('current_user')) {
      if (kDebugMode) {
        print('got - user');
      }
      currentUser?.value =
          PrenclampsiaUser.fromJson(json.decode(prefs.get('current_user').toString()));
    } else {
      if (kDebugMode) {
        print('got - none');
      }
    }
    // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
    currentUser!.notifyListeners();
    return currentUser!.value;
  }

  Future<PrenclampsiaUser> update(Preeclampsier user) async {
    //final String _apiToken = 'api_token=${currentUser.value.apiToken}';
    final envval = dotenv.env['API_ENDPOINT'];
    //final String url = '${GlobalConfiguration().getString('api_base_url')}login';
    final String url = '${envval.toString()}api/auth/local';
    final client = http.Client();
    final response = await client.post(
      Uri.parse(url),
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
      body: json.encode(user.toMap()),
    );
    setCurrentUser(response.body);
    currentUser!.value = PrenclampsiaUser.fromJson(json.decode(response.body));
    return currentUser!.value;
  }
}

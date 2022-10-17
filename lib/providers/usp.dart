import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/contentmodels/usersettings/preeclampsiausersettings.dart';
import '../repositories/authrepository.dart';
import '../repositories/preeclamsiausersettingsrepo.dart';


final createUserSettingsProvider =
    FutureProvider.family<PreEclampsiaUserSettings, Map<String, dynamic>>(
        (ref, val) async {
  final userrepository = ref.watch(authRepositoryProvider);
  final userData = await userrepository.getCurrentUser();
  final repository = ref.watch(userSettingsRepositoryProvider);
  PreEclampsiaUserSettings responce =
      await repository.postUserSettings(val, userData!.jwt);
  if (kDebugMode) {
    print("resp------ $responce");
  }
  return responce;
});

final updateUserSettingsProvider =
    FutureProvider.family<PreEclampsiaUserSettings, List>(
        (ref, val) async {
  final userrepository = ref.watch(authRepositoryProvider);
  final userData = await userrepository.getCurrentUser();
  final repository = ref.watch(userSettingsRepositoryProvider);
  PreEclampsiaUserSettings responce = await repository.updateUserSettings(
      val, userData?.jwt, userData?.user?.id);
  if (kDebugMode) {
    print("resp------ $responce");
  }
  return responce;
});

final getUserSettingsProvider =
    FutureProvider((ref) async {
  final userrepository = ref.watch(authRepositoryProvider);
  final userData = await userrepository.getCurrentUser();
  final repository = ref.watch(userSettingsRepositoryProvider);
  PreEclampsiaUserSettings responce = await repository.getUserSettings(
      userData!.jwt, userData.user!.id);
  if (kDebugMode) {
    print("resp------ $responce");
  }
  return responce;
});

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/devicemodels/android_device_data_model.dart';
import '../models/devicemodels/ios_device_data_model.dart';
import '../repositories/authrepository.dart';
import '../repositories/deviceinforepository.dart';

final postAndroidDeviceData = FutureProvider((ref) async {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  final repository = ref.watch(authRepositoryProvider);
  final trovePosRepository = ref.watch(troveUsrDeviceInfRepositoryProvider);
//
  final userData = repository.currentUser!.value;
  AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;

  final troveUsrDvcData = PreEclampsiaUsrAndroidDeviceInfo(
    //version: androidInfo.version,
    product: androidInfo.product,
    model: androidInfo.model,
    isPhysicalDevice: androidInfo.isPhysicalDevice,
    board: androidInfo.board,
    bootloader: androidInfo.bootloader,
    brand: androidInfo.brand,
    device: androidInfo.device,
    display: androidInfo.display,
    fingerprint: androidInfo.fingerprint,
    hardware: androidInfo.hardware,
    host: androidInfo.host,
    id: androidInfo.id,
    manufacturer: androidInfo.manufacturer,
    supported32BitAbis: androidInfo.supported32BitAbis,
    supported64BitAbis: androidInfo.supported64BitAbis,
    supportedAbis: androidInfo.supportedAbis,
    tags: androidInfo.tags,
    type: androidInfo.type,
    systemFeatures: androidInfo.systemFeatures,
    userid: userData.user!.id,
  ).toMap();

  PreEclampsiaUsrAndroidDeviceInfo? troveUsrDvcDataRes = await trovePosRepository
      .androidDvcUsrtTroveUsrPosData(troveUsrDvcData, userData.jwt);
  return troveUsrDvcDataRes!;
});

final postIosDeviceData = FutureProvider((ref) async {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  final repository = ref.watch(authRepositoryProvider);
  final trovePosRepository = ref.watch(troveUsrDeviceInfRepositoryProvider);
//
  final userData = repository.currentUser!.value;

  IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
  final troveUsrDvcData = PreEclampsiaUsrIosDeviceInfo(
    name: iosInfo.name,
    systemName: iosInfo.systemName,
    systemVersion: iosInfo.systemVersion,
    model: iosInfo.model,
    localizedModel: iosInfo.localizedModel,
    identifierForVendor: iosInfo.identifierForVendor,
    isPhysicalDevice: iosInfo.isPhysicalDevice,
    // utsname: iosInfo.utsname,
    userid: userData.user!.id,
  ).toMap();

  PreEclampsiaUsrIosDeviceInfo? troveUsrDvcDataRes = await trovePosRepository
      .iosDvcUsrtTroveUsrPosData(troveUsrDvcData, userData.jwt);

  return troveUsrDvcDataRes!;
});

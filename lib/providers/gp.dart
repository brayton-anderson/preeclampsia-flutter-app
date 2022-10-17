import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:geocoding/geocoding.dart';

import '../models/contentmodels/positionmodel/preeclampsiaposition.dart';
import '../repositories/authrepository.dart';
import '../repositories/preeclampsiageorep.dart';

final determinePosition = FutureProvider((ref) async {
  final preEclPosRepository = ref.watch(preeclampsiaUsrPosRepositoryProvider);
  bool serviceEnabled;
  LocationPermission permission;
  await preEclPosRepository.registerGeolocator();
  await Permission.location.request().then((value) async {
    serviceEnabled = await Geolocator?.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
  });
  return await Geolocator.getCurrentPosition();
});

final postGeolocationData = FutureProvider((ref) async {
  Position? positionInfo = await ref.watch(determinePosition.future);
  final repository = ref.watch(authRepositoryProvider);
  final preEclPosRepository = ref.watch(preeclampsiaUsrPosRepositoryProvider);
//
  final userData = repository.currentUser!.value;

  final troveUsrPos = PreEclampsiaUsrPosition(
    latitude: positionInfo!.latitude,
    longitude: positionInfo.longitude,
    //timestamp: positionInfo.timestamp,
    userid: userData.user?.id,
    altitude: positionInfo.altitude.toString(),
    accuracy: positionInfo.accuracy,
    heading: positionInfo.heading.toString(),
    floor: positionInfo.floor,
    speed: positionInfo.speed.toString(),
    speedAccuracy: positionInfo.speedAccuracy,
    isMocked: positionInfo.isMocked,
  ).toJson();
  PreEclampsiaUsrPosition? troveUsrPosRes =
      await preEclPosRepository.postTroveUsrPosData(troveUsrPos, userData.jwt);
  return troveUsrPosRes!;
});

final getGeoCodingFromPos = FutureProvider.family<Placemark, Position>((ref, val) async {
  List<Placemark> placemarks =
      await placemarkFromCoordinates(val.latitude, val.longitude);
  return placemarks.first;
});

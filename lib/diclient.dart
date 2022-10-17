import 'package:enclampsia/providers/lp.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'providers/sp.dart';
import 'providers/tcp.dart';
import 'repositories/authrepository.dart';
import 'repositories/splashrepos.dart';

final sl = GetIt.instance;

Future<void> init() async {

  // Repository
  sl.registerLazySingleton(
      () => SplashRepo(sharedPreferences: sl()));
  sl.registerLazySingleton(
      () => AuthRepository(sl()));

  // Provider
  sl.registerFactory(() => Tcp(sharedPreferences: sl()));
  sl.registerFactory(() => Sp(splashRepo: sl()));
  sl.registerFactory(() => Lp(sharedPreferences: sl()));

  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  //final Ref ref;
  //const themeData = ThemeData;
  sl.registerLazySingleton(() => sharedPreferences);
  //sl.registerLazySingleton(() => themeData);
  sl.registerLazySingleton(() => Ref);
  //sl.registerLazySingleton(() => LoggingInterceptor());
}

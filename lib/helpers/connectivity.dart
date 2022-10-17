// import 'package:connectivity/connectivity.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:trove_app/data/repository/splash_repo.dart';

// import '../provider/splash_provider.dart';

// //final dioProvider = Provider((ref) => Dio());
// final splashProvider = Provider((ref) => SplashProvider());

// class NetworkInfo {
//   final Connectivity? connectivity;
//   final Ref? ref;
//   NetworkInfo(this.connectivity, this.ref);

//   Future<bool> get isConnected async {
//     ConnectivityResult result = await connectivity!.checkConnectivity();
//     return result != ConnectivityResult.none;
//   }

//   void checkConnectivity(BuildContext? context) {
//     Connectivity()
//         .onConnectivityChanged
//         .listen((ConnectivityResult? result) async {
//       final result = ref!.watch(splashProvider).firstTimeConnectionCheck;
//       if (result!) {
//         ref!.read(splashProvider).setFirstTimeConnectionCheck(false);
//         // Provider.of<SplashProvider>(context, listen: false)
//         //     .setFirstTimeConnectionCheck(false);
//       } else {
//         bool isNotConnected = result == ConnectivityResult.none;
//         isNotConnected
//             ? const SizedBox()
//             : ScaffoldMessenger.of(context!).hideCurrentSnackBar();
//         ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
//           backgroundColor: isNotConnected ? Colors.red : Colors.green,
//           duration: Duration(seconds: isNotConnected ? 6000 : 3),
//           content: const Text(
//             '',
//             // isNotConnected
//             //     ? getTranslated('no_connection', context)
//             //     : getTranslated('connected', context),
//             textAlign: TextAlign.center,
//           ),
//         ));
//       }
//     });
//   }
// }

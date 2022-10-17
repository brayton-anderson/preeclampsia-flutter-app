import 'preeclampsiaerror.dart';
import 'preeclamsier.dart';

class PrenclampsiaUser {
  String? jwt;
  Preeclampsier? user;
  PreEclampsiaErrors? errorz;

  PrenclampsiaUser({this.jwt, this.user});

  PrenclampsiaUser.fromJson(Map<String, dynamic> json) {
    jwt = json['jwt'];
    user = json['user'] != null ? Preeclampsier.fromJson(json['user']) : null;
    errorz = json['error'] != null ? PreEclampsiaErrors.fromJson(json['error']) : null;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['jwt'] = jwt;
    if (user != null) {
      data['user'] = user!.toMap();
    }
    return data;
  }
}

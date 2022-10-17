import 'preeclampsiausersettings.dart';

class PreEclampsiaUserSettingsValue {
  String? id;
  PreEclampsiaUserSettings? usersettings;

  PreEclampsiaUserSettingsValue({this.id, this.usersettings});

  PreEclampsiaUserSettingsValue.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    usersettings = json['attributes'] != null
        ? PreEclampsiaUserSettings.fromJson(json['attributes'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (usersettings != null) {
      data['usersettings'] = usersettings!.toJson();
    }
    return data;
  }
}
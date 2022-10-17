class PreEclampsiaUserSettings {
  String? theme;
  String? appUsage;
  String? dateofbirth;
  String? gender;
  String? profilepicture;
  String? notifications;
  String? termsagreement;
  String? bioinfo;
  String? longitude;
  String? latitude;
  String? addressone;
  String? city;
  String? country;
  String? state;
  List? categoriesdata;
  String? phone;
  String? countrycode;
  String? tax;
  String? currency;
  String? onboadingScreen;
  String? userid;

  PreEclampsiaUserSettings({
    this.theme,
    this.appUsage,
    this.dateofbirth,
    this.gender,
    this.profilepicture,
    this.notifications,
    this.termsagreement,
    this.bioinfo,
    this.longitude,
    this.latitude,
    this.addressone,
    this.city,
    this.country,
    this.state,
    this.categoriesdata,
    this.phone,
    this.countrycode,
    this.tax,
    this.onboadingScreen,
    this.currency,
    this.userid,
  });

  PreEclampsiaUserSettings.fromJson(Map<String, dynamic> json) {
    theme = json['theme'].toString();
    appUsage = json['app_usage'].toString();
    dateofbirth = json['dateofbirth'].toString();
    gender = json['gender'];
    profilepicture = json['profilepicture'];
    notifications = json['notifications'].toString();
    termsagreement = json['termsagreement'].toString();
    bioinfo = json['bioinfo'];
    longitude = json['longitude'].toString();
    latitude = json['latitude'].toString();
    onboadingScreen = json['onboading_screen'].toString();
    addressone = json['addressone'];
    city = json['city'];
    country = json['country'];
    state = json['state'];
    categoriesdata = json['categoriesdata'];
    phone = json['phone'];
    countrycode = json['countrycode'].toString();
    tax = json['tax'].toString();
    currency = json['currency'];
    userid = json['userid'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['theme'] = theme;
    data['app_usage'] = appUsage;
    data['dateofbirth'] = dateofbirth;
    data['gender'] = gender;
    data['profilepicture'] = profilepicture;
    data['notifications'] = notifications;
    data['termsagreement'] = termsagreement;
    data['bioinfo'] = bioinfo;
    data['longitude'] = longitude;
    data['latitude'] = latitude;
    data['addressone'] = addressone;
    data['city'] = city;
    data['country'] = country;
    data['state'] = state;
    data['categoriesdata'] = categoriesdata;
    data['phone'] = phone;
    data['countrycode'] = countrycode;
    data['tax'] = tax;//
    data['onboading_screen'] = onboadingScreen;
    data['currency'] = currency;
    data['userid'] = userid;
    return data;
  }
}

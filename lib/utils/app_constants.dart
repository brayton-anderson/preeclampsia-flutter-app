import '../models/innermodels/languagemodel.dart';

class AppConstants {
  static const String appname = 'Trove';

  static const String baseurl = 'https://demo.6amtech.com/grofresh';
  static const String configuri = '/config/user';

  // Shared Key
  static const String theme = 'theme';
  static const String useridss = 'userid';
  static const String jwtoken = 'tokenss';
  static const String authtoken= 'auth_token';
  static const String phoneverification = 'verification_id';
  static const String countrycode = 'country_code';
  static const String languagecode = 'language_code';
  static const String userpassword= 'user_password';
  static const String useraddress = 'user_address';
  static const String usernumber = 'user_number';
  static const String username = 'user_name';
  static const String useremail = 'user_email';
  static const String userimage = 'user_image';

  static const String isLoggedin = 'isloggedin';
  static const String veriSuccess = 'verisuccess';
  //registration
  static const String regSuccess = 'regsuccess';

  //getuerinfo
  static const String guiSuccess = 'guisuccess';

  //checkuerinfo
  static const String cuiSuccess = 'cuisuccess';
  // static const String cuiError2 = 'cuierror2';

  static List<LanguageModel> languages = [
    LanguageModel(
        imageUrl: '',
        languageName: 'English',
        countryCode: 'US',
        languageCode: 'en'),
    LanguageModel(
        imageUrl: '',
        languageName: 'arabic',
        countryCode: 'SA',
        languageCode: 'ar'),
  ];
}

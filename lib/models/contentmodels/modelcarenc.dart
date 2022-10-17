import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:uuid/uuid.dart';



class Dunt {
  BuildContext? one;
  String? two;
  Dunt({this.one, this.two});
}

class Ustore {
  String? memval;
  String? email;
  String? pass;
  String? fname;
  String? lname;
  String? uname;
  Ustore({
    this.uname,
    this.email,
    this.pass,
    this.fname,
    this.lname,
    this.memval
  });
}

Future<Ustore> ustoreVal() async{
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  return Ustore(
    uname: sharedPreferences.getString("uname"),
    email: sharedPreferences.getString("email"),
    pass: sharedPreferences.getString("pass"),
    fname: sharedPreferences.getString("fname"),
    lname: sharedPreferences.getString("lname"),
    memval: sharedPreferences.getString("memval"),
  );
}
class Uval {
  String? one;
  String? two;
  String? three;
  String? four;
  String? five;
  String? six;
  String? seven;
  Uval(
      {this.one,
      this.two,
      this.three,
      this.four,
      this.five,
      this.six,
      this.seven});
}

class Controlss {
  Control? one;
  int? two;
  Controlss({this.one, this.two});
}

class CharEnc {
  String? one;
  String? two;
  String? three;
  String? four;
  String? five;
  String? six;

  CharEnc({this.one, this.two, this.three, this.four, this.five, this.six});
}

var uuid = const Uuid();

CharEnc charEnc = CharEnc(
  one: dotenv.env['ENC_ONE'].toString(),
  two: dotenv.env['ENC_TWO'].toString(),
  three: dotenv.env['ENC_THREE'].toString(),
  four: dotenv.env['ENC_FOUR'].toString(),
  five: uuid.v4().substring(0, 13),
  six: uuid.v4().substring(0, 13),
);
//static charEncVal(){
//if (kDebugMode) {
//print();
//}
String uuidString = "uuid ${charEnc.five}";
String zxValue = dotenv.env['MEX_P'].toString();
String oxValue = dotenv.env['UZR_M'].toString();

String xzxValue =
    "${charEnc.five}${charEnc.three}$zxValue${charEnc.six}${charEnc.one}";
String xoxValue =
    "${charEnc.five}${charEnc.two}$oxValue${charEnc.six}${charEnc.four}";
//}

//charEncVal.
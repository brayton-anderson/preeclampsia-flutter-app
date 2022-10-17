import 'dart:io';
import 'package:http/http.dart' as http;

class HealthData {
  String? userId;
  String? water;
  String? distance;
  String? steps;
  String? babykicks;
  String? fatalheartrate;
  String? saturation;
  String? temprature;
  String? heartrate;
  String? createdAt;

  HealthData(
      {this.userId,
      this.water,
      this.distance,
      this.steps,
      this.babykicks,
      this.fatalheartrate,
      this.saturation,
      this.temprature,
      this.heartrate,
      this.createdAt,
      });

  HealthData.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    water = json['water'];
    distance = json['distance'];
    steps = json['steps'];
    babykicks = json['babykicks'];
    fatalheartrate = json['fatalheartrate'];
    saturation = json['saturation'];
    temprature = json['temprature'];
    heartrate = json['heartrate'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['water'] = water;
    data['distance'] = distance;
    data['steps'] = steps;
    data['babykicks'] = babykicks;
    data['fatalheartrate'] = fatalheartrate;
    data['saturation'] = saturation;
    data['temprature'] = temprature;
    data['heartrate'] = heartrate;
    data['createdAt'] = createdAt;
    return data;
  }
}


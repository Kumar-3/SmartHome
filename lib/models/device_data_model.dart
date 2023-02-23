// To parse this JSON data, do
//
//     final deviceDataModel = deviceDataModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

DeviceDataModel deviceDataModelFromJson(String str) => DeviceDataModel.fromJson(json.decode(str));

String deviceDataModelToJson(DeviceDataModel data) => json.encode(data.toJson());

class DeviceDataModel {
  DeviceDataModel({
    required this.brightness10,
    required this.brightness20,
    required this.brightness30,
    required this.lightOff,
    required this.lightOn,
  });

  final int brightness10;
  final int brightness20;
  final int brightness30;
  final int lightOff;
  final int lightOn;

  factory DeviceDataModel.fromJson(Map<String, dynamic> json) => DeviceDataModel(
        brightness10: json["Brightness_10"],
        brightness20: json["Brightness_20"],
        brightness30: json["Brightness_30"],
        lightOff: json["Light_OFF"],
        lightOn: json["Light_ON"],
      );

  Map<String, dynamic> toJson() => {
        "Brightness_10": brightness10,
        "Brightness_20": brightness20,
        "Brightness_30": brightness30,
        "Light_OFF": lightOff,
        "Light_ON": lightOn,
      };
}

import 'dart:convert';

import 'package:get/get.dart';
import 'package:smarthome/models/device_data_model.dart';
import 'package:smarthome/models/weather_details_model.dart';

class WeatherDataProvider extends GetConnect {
  //get data
  Future<WeatherDataModel?> getweather() async {
    Response response = await get(
      "https://api.openweathermap.org/data/2.5/weather?lat=18.5204&lon=73.8567&appid=683cc31271b4cfbf58562620f24eaf27&units=metric",
    );
    if (response.statusCode == 200) {
      return weatherDataModelFromJson(response.bodyString.toString());
    } else {
      return null;
    }
  }
}

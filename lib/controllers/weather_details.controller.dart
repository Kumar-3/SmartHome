import 'package:get/get.dart';
import 'package:smarthome/models/weather_details_model.dart';
import 'package:smarthome/providers/weather_provider.dart';

class WeatherDetailsController extends GetxController with StateMixin<WeatherDataModel> {
  var temp = 0.0.obs;
  var pressure = 0.obs;
  var humidity = 0.obs;
  var weather = "".obs;
  var windspeed = 0.0.obs;
  var weathericonurl = "".obs;

  void onInit() {
    super.onInit();
    getWeather();
  }

  getWeather() {
    WeatherDataProvider().getweather().then(
      (value) {
        print(value!.main);
        if (value != null) {
          temp.value = value.main.temp;
          pressure.value = value.main.pressure;
          humidity.value = value.main.humidity;
          weather.value = value.weather[0].main;
          windspeed.value = value.wind.speed;
          weathericonurl.value = value.weather[0].icon;
        } else {
          Get.snackbar("Error", "Error while fetching Weather data");
        }
      },
    );
  }
}

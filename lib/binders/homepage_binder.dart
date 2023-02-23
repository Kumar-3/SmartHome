import 'package:get/get.dart';
import 'package:smarthome/controllers/homepage_controller.dart';
import 'package:smarthome/controllers/login_controller.dart';
import 'package:smarthome/controllers/weather_details.controller.dart';

class HomepageBinder implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomepageController>(() => HomepageController(), fenix: true);
    Get.lazyPut<LoginController>(() => LoginController(), fenix: true);
    Get.lazyPut<WeatherDetailsController>(() => WeatherDetailsController(), fenix: true);
  }
}

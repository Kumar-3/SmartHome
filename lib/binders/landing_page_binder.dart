import 'package:get/get.dart';
import 'package:smarthome/controllers/landing_page_controller.dart';

class LandingPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(LandingPageController());
  }
}

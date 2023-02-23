import 'package:get/get.dart';
import 'package:smarthome/controllers/Sign_up_controller.dart';
import 'package:smarthome/controllers/login_controller.dart';

import '../controllers/homepage_controller.dart';

class LandingPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController(), fenix: true);
    Get.lazyPut<SignUpController>(() => SignUpController(), fenix: true);
    Get.lazyPut<HomepageController>(() => HomepageController(), fenix: true);
  }
}

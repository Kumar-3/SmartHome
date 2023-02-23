import 'package:get/get.dart';

class LandingPageController extends GetxController {
  @override
  void onInit() {
    super.onInit();

    Future.delayed(Duration(seconds: 3), () {
      Get.offAndToNamed("/login");
    });
  }
}

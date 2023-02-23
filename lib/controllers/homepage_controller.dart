import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smarthome/providers/device_data_provider.dart';
import 'package:smarthome/providers/weather_provider.dart';

class HomepageController extends GetxController with GetSingleTickerProviderStateMixin {
  late TabController tabController;

  var name = "".obs;
  var email = "".obs;

  RxDouble b1 = 0.0.obs;
  RxDouble b2 = 0.0.obs;
  RxDouble b3 = 0.0.obs;
  var b4 = false.obs;
  var b5 = false.obs;

  var lodingint = true.obs;

  void onInit() {
    RxStatus.loading();
    super.onInit();
    getDeviceData();

    tabController = TabController(length: 4, vsync: this);
  }

  getDeviceData() {
    DeviceDataProvider().getdevicedata().then(
      (value) {
        if (value != null) {
          b1.value = value.brightness10.toDouble();
          b2.value = value.brightness20.toDouble();
          b3.value = value.brightness30.toDouble();
          value.lightOff == 0 ? b4.value = false : b4.value = true;
          value.lightOn == 0 ? b5.value = false : b5.value = true;
          lodingint.value = false;
        }
      },
    );
  }

  onmasterbuttonpressed(val) async {
    b5.value = !b5.value;
    if (b5.value == false) {
      b1.value = 0.0;
      b2.value = 0.0;
      b3.value = 0.0;
      b4.value = false;
      b5.value = false;
    } else {
      b1.value = 100.0;
      b2.value = 100.0;
      b3.value = 100.0;
      b4.value = true;
      b5.value = true;
    }
    await onAnyValueUpdate();
  }

  onAnyValueUpdate() async {
    await DeviceDataProvider().updatedevicedata(
      {
        "Brightness_10": b1.value.toInt(),
        "Brightness_20": b2.value.toInt(),
        "Brightness_30": b3.value.toInt(),
        "Light_OFF": b4.value == true ? 1 : 0,
        "Light_ON": b5.value == true ? 1 : 0
      },
    ).then(
      (value) {
        getDeviceData();
      },
    );
  }
}

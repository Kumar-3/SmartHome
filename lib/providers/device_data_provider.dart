import 'dart:convert';

import 'package:get/get.dart';
import 'package:smarthome/models/device_data_model.dart';

class DeviceDataProvider extends GetConnect {
  //get data
  Future<DeviceDataModel?> getdevicedata() async {
    Response response = await get(
      "https://forapi-dc639-default-rtdb.firebaseio.com/.json",
    );
    if (response.statusCode == 200) {
      return deviceDataModelFromJson(response.bodyString.toString());
    } else {
      return null;
    }
  }

  //update
  Future<DeviceDataModel?> updatedevicedata(jsonArray) async {
    Response response = await patch("https://forapi-dc639-default-rtdb.firebaseio.com/.json", jsonEncode(jsonArray),
        headers: <String, String>{});
    if (response.statusCode == 200) {
      return deviceDataModelFromJson(response.bodyString.toString());
    } else {
      return null;
    }
  }
}

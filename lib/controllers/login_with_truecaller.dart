// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_truecaller/flutter_truecaller.dart';
import 'package:get/get.dart';
import 'package:smarthome/controllers/homepage_controller.dart';
import 'package:smarthome/controllers/weather_details.controller.dart';
import 'package:truecaller_sdk/truecaller_sdk.dart';
import 'dart:async';

class LoginWithTruecallerController extends GetxController {
  final FlutterTruecaller truecaller = Get.put(FlutterTruecaller());
  HomepageController homepageController = Get.put(HomepageController());
  WeatherDetailsController weatherdetailscontroller = Get.put(WeatherDetailsController());
  @override
  void onInit() {
    super.onInit();
    getTruecaller();
  }

  Future getTruecaller() async {
    TruecallerSdk.initializeSDK(
        sdkOptions: TruecallerSdkScope.SDK_OPTION_WITH_OTP,
        footerType: FlutterTruecallerScope.FOOTER_TYPE_ANOTHER_METHOD,
        consentMode: FlutterTruecallerScope.CONSENT_MODE_POPUP);
    TruecallerSdk.isUsable.then((isUsable) {
      isUsable
          ? TruecallerSdk.getProfile
          : Get.snackbar("Error", "Truecaller app not detected, Please download truecaller app to login seamlessly");
    });
    StreamSubscription streamSubscription = TruecallerSdk.streamCallbackData.listen(
      (truecallerSdkCallback) {
        switch (truecallerSdkCallback.result) {
          case TruecallerSdkCallbackResult.success:
            //If Truecaller user and has Truecaller app on his device, you'd directly get the Profile
            String firstName = truecallerSdkCallback.profile!.firstName;
            String? lastName = truecallerSdkCallback.profile!.lastName;
            String phNo = truecallerSdkCallback.profile!.phoneNumber;
            homepageController.name.value = firstName;

            Get.toNamed('/homepage');
            break;
          case TruecallerSdkCallbackResult.failure:
            int errorCode = truecallerSdkCallback.error!.code;
            break;
          case TruecallerSdkCallbackResult.verification:
            int? errorCode = truecallerSdkCallback.error?.code;
            print("Manual Verification Required!");
            Get.snackbar("Error", "Truecaller app not detected, Please download truecaller app to login seamlessly");
            break;
          default:
            Get.snackbar("Error",
                "Error occured while fetching truecaller details truecaller maybe unavalable please try again later");
        }
      },
    );
  }

  void manualTruecallerVerification() async {
    TruecallerSdkCallback truecallerSdkCallback = await TruecallerSdk.requestVerification(phoneNumber: "7769066177");

    Future.delayed(
      const Duration(seconds: 2),
      () {
        switch (truecallerSdkCallback.result) {
          case TruecallerSdkCallbackResult.missedCallInitiated:
            String? ttl = truecallerSdkCallback.ttl;
            break;
          case TruecallerSdkCallbackResult.missedCallReceived:
            TruecallerSdk.verifyMissedCall(firstName: "FIRST_NAME", lastName: "LAST_NAME");

            break;
          case TruecallerSdkCallbackResult.otpInitiated:
            String? ttl = truecallerSdkCallback.ttl;
            break;
          case TruecallerSdkCallbackResult.otpReceived:
            TruecallerSdk.verifyOtp(firstName: "FIRST_NAME", lastName: "LAST_NAME", otp: "OTP");
            String? otp = truecallerSdkCallback.otp;
            break;
          case TruecallerSdkCallbackResult.verificationComplete:
            String? token = truecallerSdkCallback.accessToken;
            break;
          case TruecallerSdkCallbackResult.verifiedBefore:
            String firstName = truecallerSdkCallback.profile!.firstName;
            String? lastName = truecallerSdkCallback.profile!.lastName;
            String phNo = truecallerSdkCallback.profile!.phoneNumber;
            String? token = truecallerSdkCallback.profile!.accessToken;
            break;
          case TruecallerSdkCallbackResult.exception:
            int exceptionCode = truecallerSdkCallback.exception!.code;
            String exceptionMsg = truecallerSdkCallback.exception!.message;
            break;
          default:
            print("Invalid result");
        }
      },
    );
  }

  void verifyOtp(otp) {
    TruecallerSdk.verifyOtp(
      firstName: "FIRST_NAME",
      lastName: "LAST_NAME",
      otp: "$otp",
    );
  }
}

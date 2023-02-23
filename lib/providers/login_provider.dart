import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:smarthome/controllers/Sign_up_controller.dart';
import 'package:smarthome/controllers/homepage_controller.dart';
import 'package:smarthome/controllers/login_controller.dart';
import 'package:smarthome/view/pages/login_page.dart';

class LoginProvider extends GetConnect {
  var auth = FirebaseAuth.instance;
  LoginController logincontroller = Get.put(LoginController());

  Future Login() async {
    try {
      FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: "+91${logincontroller.phonenumber.value}",
        verificationCompleted: (PhoneAuthCredential credential) async {
          await auth.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          Get.snackbar("Error while Sign Up", e.toString());
          print(e);
        },
        codeSent: (String verificationId, int? resendToken) async {
          logincontroller.loginverificationid.value = '';
          print("veri id afterr clear ${logincontroller.loginverificationid.value}");
          logincontroller.loginverificationid.value = verificationId;
          print("login vala verification id \n ${logincontroller.loginverificationid.value}");

          // Login().signupotpverification();
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } catch (e) {
      Get.snackbar("Error", e.toString());
      print(e);
    }
  }

  verifyOtp(otp) async {
    try {
      print("Otp vala verification id \n ${logincontroller.loginverificationid.value}");
      FirebaseAuth.instance
          .signInWithCredential(
              PhoneAuthProvider.credential(verificationId: logincontroller.loginverificationid.value, smsCode: otp))
          .then((value) {
        print(value.user!.displayName);
        HomepageController().name.value = auth.currentUser!.displayName!;
        Get.close(2);
      });

      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: logincontroller.loginverificationid.value,
        smsCode: otp,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      Get.snackbar("Error", e.toString());
      print(e);
    }
  }
}

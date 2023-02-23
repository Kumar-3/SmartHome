import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:smarthome/controllers/Sign_up_controller.dart';
import 'package:smarthome/controllers/homepage_controller.dart';
import 'package:smarthome/controllers/login_controller.dart';
import 'package:smarthome/view/pages/login_page.dart';

class SignUpProvider extends GetConnect {
  var auth = FirebaseAuth.instance;
  SignUpController signUpController = Get.put(SignUpController());

  Future SignUp() async {
    try {
      var firebaseauth = FirebaseAuth.instance
          .verifyPhoneNumber(
            phoneNumber: "+91${signUpController.phoneno.value}",
            verificationCompleted: (PhoneAuthCredential credential) async {
              await auth.signInWithCredential(credential);
            },
            verificationFailed: (FirebaseAuthException e) {
              Get.snackbar("Error while Sign Up", e.toString());
              print(e);
            },
            codeSent: (String verificationId, int? resendToken) async {
              signUpController.verificationid.value = verificationId;

              // Login().signupotpverification();
            },
            codeAutoRetrievalTimeout: (String verificationId) {},
          )
          .then((value) {});
    } catch (e) {
      Get.snackbar("Error", e.toString());
      print(e);
    }
  }

  verifyOtp(String otp) async {
    try {
      var firebaseauth = FirebaseAuth.instance
          .signInWithCredential(PhoneAuthProvider.credential(
              verificationId: signUpController.verificationid.value,
              smsCode: otp))
          .then((value) {
        signUpController.isLoading.value = false;
        auth.currentUser!.updateDisplayName(signUpController.name.value);
        auth.currentUser!.updateEmail(signUpController.email.value);
        HomepageController().name.value =
            auth.currentUser!.displayName ?? "User";
        Get.close(1);
      });
    } catch (e) {
      signUpController.isLoading.value = false;
      Get.snackbar("Error", e.toString());
    }
  }
}

import 'package:get/get.dart';
import 'package:smarthome/providers/sign_up_provider.dart';
import 'package:smarthome/view/pages/login_page.dart';

class SignUpController extends GetxController {
  var name = "".obs;
  var email = "".obs;
  var phoneno = "".obs;
  var nameerror = "".obs;
  var emailerror = "".obs;
  var phonenoerror = "".obs;
  var verificationid = "".obs;
  var isLoading = false.obs;
  var otp = ''.obs;

  onNameChange(val) {
    name.value = val;
  }

  onEmailChange(val) {
    email.value = val;
  }

  onPhoneNoChange(val) {
    phoneno.value = val;
  }

  onotpchange(val) {
    otp.value = val;
  }

  validations() async {
    if (name.value != "") {
      nameerror.value = "Please Enter Your Name";
      if (email.value != "") {
        nameerror.value = "";
        emailerror.value = "Please Enter Your Email";
        if (phoneno.value.length != 10) {
          emailerror.value = "";
          phonenoerror.value = "Please Enter a Valid Number";
        } else {
          nameerror.value = "";
          emailerror.value = "";
          phonenoerror.value = "";

          onSignUp();
          // Get.close(1);
          Login().signupotpverification();
        }
      }
    }
  }

  onSignUp() {
    SignUpProvider().SignUp();
  }

  otpVerify() {
    try {
      SignUpProvider().verifyOtp(otp.value);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
    ;
  }
}

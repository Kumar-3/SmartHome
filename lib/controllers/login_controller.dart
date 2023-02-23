import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'homepage_controller.dart';

class LoginController extends GetxController {
  var phonenumber = "".obs;
  var phoneerror = "".obs;
  var otpvalue = "".obs;
  var loginverificationid = "".obs;
  var name = "".obs;
  var verificationCode = "".obs;
  var userId = "".obs;
  var auth = FirebaseAuth.instance;
  var isLoading = false.obs;
  HomepageController homepageController = Get.put(HomepageController());

  onnumberchanged(value) {
    phonenumber.value = value;
  }

  onOtpChanged(value) {
    otpvalue.value = value.toString();
  }

  validation(context, size) async {
    if (phonenumber.value.length == 10) {
      phoneerror.value = "";
      await login();
      showGeneralDialog(
        barrierDismissible: true,
        barrierLabel: "SignUp",
        context: context,
        pageBuilder: (context, _, __) => Center(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: size.height * .015),
            padding: EdgeInsets.symmetric(vertical: size.height * .012, horizontal: size.height * .04),
            height: size.height * .5,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(
                size.height * .02,
              ),
            ),
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor: Colors.transparent,
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: size.height * .02,
                  ),
                  Text(
                    "Verification",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.merriweather(
                      fontSize: size.height * .02,
                    ),
                  ),
                  SizedBox(
                    height: size.height * .04,
                  ),
                  Text(
                    "We sent you an SMS code:",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.merriweather(
                      fontSize: size.height * .025,
                    ),
                  ),
                  SizedBox(
                    height: size.height * .01,
                  ),
                  Row(
                    children: [
                      Text(
                        "on Number :",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.merriweather(
                          fontSize: size.height * .018,
                        ),
                      ),
                      Text(
                        phonenumber.value,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.merriweather(
                          color: Colors.teal,
                          fontSize: size.height * .018,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * .04,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: size.height * .07,
                        width: size.width * .75,
                        child: TextField(
                          onChanged: (value) {
                            onOtpChanged(value);
                          },
                          style: TextStyle(
                            fontSize: size.height * .03,
                          ),
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: size.height * .01, vertical: size.height * .01),
                            filled: true,
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                          ),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(6),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * .01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Dont recive the OTP?",
                        style: GoogleFonts.merriweather(
                          color: CupertinoColors.systemGrey,
                          fontSize: size.height * .015,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          isLoading.value = false;
                          login();
                        },
                        child: Text(
                          " RESEND OTP",
                          style: GoogleFonts.merriweather(
                            color: Colors.teal,
                            fontSize: size.height * .020,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * .02,
                  ),
                  SizedBox(
                    width: size.width * .7,
                    // height: size.height * .05,
                    child: Obx(() => ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.teal,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(
                                  size.height * .02,
                                ),
                                bottomRight: Radius.circular(
                                  size.height * .005,
                                ),
                                topLeft: Radius.circular(
                                  size.height * .005,
                                ),
                                topRight: Radius.circular(
                                  size.height * .02,
                                ),
                              ),
                            ),
                          ),
                          onPressed: () {
                            verifyotp();
                          },
                          icon: isLoading == true
                              ? Transform.scale(
                                  scale: 0.7,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                )
                              : Icon(
                                  Icons.arrow_right,
                                  color: Colors.white,
                                ),
                          label: Text(
                            "Verify",
                            style: GoogleFonts.merriweather(
                              color: Colors.white,
                              fontSize: size.height * .03,
                            ),
                          ),
                        )),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    } else {
      phoneerror.value = "Enter a valid Number";
    }
  }

  login() async {
    await Login();
  }

  verifyotp() async {
    await verifyOTP().then((val) {
      if (val != null) {
        Get.close(1);
        Get.offAndToNamed('/homepage');
      }
    });
  }

  Future Login() async {
    try {
      FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: "+91${phonenumber.value.toString()}",
        verificationCompleted: (PhoneAuthCredential credential) async {
          await auth.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          Get.snackbar("Error while Sign Up", e.toString());
          print(e);
        },
        codeSent: (String verificationId, int? resendToken) async {
          verificationCode.value = verificationId.toString().trim();
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } catch (e) {
      Get.snackbar("Error", e.toString());
      print(e);
    }
  }

  Future<String?> verifyOTP() async {
    isLoading.value = true;
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationCode.value.toString().trim(),
        smsCode: otpvalue.value.toString(),
      );

      final UserCredential userCredential = await auth.signInWithCredential(credential);

      // Get the user
      final User? user = userCredential.user;

      if (user != null) {
        userId.value = user.uid;
        homepageController.name.value = user.displayName.toString();
        return userId.value;
      } else {
        return "0";
      }
    } catch (e) {
      isLoading.value = false;
      print('Verification failed: $e');
      Get.snackbar("Error", e.toString());
    }
  }
}

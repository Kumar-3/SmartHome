import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_truecaller/flutter_truecaller.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smarthome/controllers/Sign_up_controller.dart';
import 'package:smarthome/controllers/login_controller.dart';
import 'package:smarthome/controllers/login_with_truecaller.dart';

class Login extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Get.put(LoginController());
    LoginWithTruecallerController loginWithTruecallerController =
        Get.put(LoginWithTruecallerController());
    SignUpController signUpController = Get.put(SignUpController());
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: EdgeInsets.all(size.height * .025),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(
                flex: 1,
              ),
              Text(
                "Welcome back",
                textAlign: TextAlign.center,
                style: GoogleFonts.merriweather(
                  fontWeight: FontWeight.bold,
                  fontSize: size.height * .03,
                ),
              ),
              SizedBox(
                height: size.height * .01,
              ),
              Text(
                "making your home smart easy with us",
                textAlign: TextAlign.center,
                style: GoogleFonts.merriweather(
                  fontSize: size.height * .02,
                ),
              ),
              SizedBox(
                height: size.height * .05,
              ),
              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Phone Number",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.merriweather(
                        fontSize: size.height * .017,
                      ),
                    ),
                    SizedBox(
                      height: size.height * .01,
                    ),
                    Obx(() => TextFormField(
                          // cursorColor: CustomTheme.black,
                          // controller: logincontroller.emailcontroller,
                          onChanged: (value) {
                            controller.onnumberchanged(value);
                            controller.validation(context, size);
                          },
                          cursorHeight: 30,
                          keyboardType: TextInputType.phone,
                          maxLength: 10,

                          style: TextStyle(
                            color: Colors.black,
                            fontSize: size.height * .023,
                            fontWeight: FontWeight.w500,
                            letterSpacing: size.height * .001,
                          ),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: size.height * .01,
                                vertical: size.height * .01),
                            hintStyle: TextStyle(
                                fontSize: size.height * .02,
                                color: Colors.grey.shade500),
                            filled: true,
                            fillColor: Colors.teal.shade50,
                            errorText: controller.phoneerror.value.isEmpty
                                ? null
                                : controller.phoneerror.value,
                            border: InputBorder.none,
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.redAccent,
                                width: size.height * .002,
                              ),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.redAccent,
                                width: size.height * .002,
                              ),
                            ),
                            enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide.none),
                            focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide.none),
                          ),
                        )),
                    SizedBox(
                      height: size.height * .02,
                    ),
                    SizedBox(
                      width: size.width * .55,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          controller.validation(context, size);
                        },
                        icon: Icon(
                          // FontAwesomeIcons.arrowRight,
                          color: Colors.white,
                          Icons.arrow_right,
                          size: size.height * .02,
                          // color: CustomTheme.pinkish,
                        ),
                        label: Text(
                          "Request OTP",
                          style: GoogleFonts.merriweather(
                            color: Colors.white,
                            fontSize: size.height * .02,
                            // color: CustomTheme.pinkish,
                          ),
                        ),
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
                      ),
                    ),
                    SizedBox(
                      height: size.height * .04,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: size.width * .3,
                          child: Divider(
                            height: 0,
                            thickness: size.height * .002,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(size.height * .005),
                          child: SizedBox(
                            child: Text(
                              "OR",
                              style: TextStyle(color: Colors.grey.shade500),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: size.width * .3,
                          child: Divider(
                            height: 0,
                            thickness: size.height * .002,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: size.height * .02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            //  FlutterTruecaller.
                            await loginWithTruecallerController.getTruecaller();
                          },
                          child: Container(
                            height: size.height * .03,
                            // color: Colors.red,
                            child: Row(
                              children: [
                                Image.asset("assets/truecaller_logo.png"),
                                Image.asset("assets/TrueCaller.png")
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Spacer(
                flex: 1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Dont have a account?",
                    style: GoogleFonts.merriweather(
                      fontSize: size.height * .018,
                      // color: CustomTheme.pinkish,
                    ),
                  ),
                  GestureDetector(
                    child: Text(
                      "Sign Up",
                      style: GoogleFonts.merriweather(
                        color: Colors.teal,
                        fontWeight: FontWeight.bold,
                        fontSize: size.height * .018,
                        // color: CustomTheme.pinkish,
                      ),
                    ),
                    onTap: () {
                      Get.dialog(Center(
                        child: Container(
                          height: size.height * .6,
                          width: size.width * .9,
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Colors.teal.shade50,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Scaffold(
                            backgroundColor: Colors.transparent,
                            resizeToAvoidBottomInset: false,
                            body: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "Sign Up",
                                  style: GoogleFonts.merriweather(
                                    color: Colors.teal,
                                    fontWeight: FontWeight.bold,
                                    fontSize: size.height * .02,
                                    // color: CustomTheme.pinkish,
                                  ),
                                ),
                                Form(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(5),
                                        child: Text(
                                          "Name",
                                          style: GoogleFonts.merriweather(
                                            fontWeight: FontWeight.bold,
                                            fontSize: size.height * .015,
                                          ),
                                        ),
                                      ),
                                      Obx(
                                        () => TextFormField(
                                          // cursorColor: CustomTheme.black,
                                          // controller: logincontroller.emailcontroller,
                                          onChanged: (value) {
                                            signUpController
                                                .onNameChange(value);
                                          },
                                          cursorHeight: 30,
                                          keyboardType: TextInputType.name,

                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: size.height * .023,
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: size.height * .001,
                                          ),
                                          decoration: InputDecoration(
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal:
                                                        size.height * .01,
                                                    vertical:
                                                        size.height * .01),
                                            hintStyle: TextStyle(
                                                fontSize: size.height * .02,
                                                color: Colors.grey.shade500),
                                            filled: true,
                                            fillColor: Colors.white,
                                            errorText: signUpController
                                                    .nameerror.value.isEmpty
                                                ? null
                                                : signUpController
                                                    .nameerror.value,
                                            border: InputBorder.none,
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.redAccent,
                                                width: size.height * .002,
                                              ),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.redAccent,
                                                width: size.height * .002,
                                              ),
                                            ),
                                            enabledBorder:
                                                const OutlineInputBorder(
                                                    borderSide:
                                                        BorderSide.none),
                                            focusedBorder:
                                                const OutlineInputBorder(
                                                    borderSide:
                                                        BorderSide.none),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(5),
                                        child: Text(
                                          "Email",
                                          style: GoogleFonts.merriweather(
                                            fontWeight: FontWeight.bold,
                                            fontSize: size.height * .015,
                                          ),
                                        ),
                                      ),
                                      Obx(
                                        () => TextFormField(
                                          // cursorColor: CustomTheme.black,
                                          // controller: logincontroller.emailcontroller,
                                          onChanged: (value) {
                                            signUpController
                                                .onEmailChange(value);
                                          },
                                          cursorHeight: 30,
                                          keyboardType:
                                              TextInputType.emailAddress,

                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: size.height * .023,
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: size.height * .001,
                                          ),
                                          decoration: InputDecoration(
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal:
                                                        size.height * .01,
                                                    vertical:
                                                        size.height * .01),
                                            hintStyle: TextStyle(
                                                fontSize: size.height * .02,
                                                color: Colors.grey.shade500),
                                            filled: true,
                                            fillColor: Colors.white,
                                            errorText: signUpController
                                                    .emailerror.value.isEmpty
                                                ? null
                                                : signUpController
                                                    .emailerror.value,
                                            border: InputBorder.none,
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.redAccent,
                                                width: size.height * .002,
                                              ),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.redAccent,
                                                width: size.height * .002,
                                              ),
                                            ),
                                            enabledBorder:
                                                const OutlineInputBorder(
                                                    borderSide:
                                                        BorderSide.none),
                                            focusedBorder:
                                                const OutlineInputBorder(
                                                    borderSide:
                                                        BorderSide.none),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(5),
                                        child: Text(
                                          "Phone No",
                                          style: GoogleFonts.merriweather(
                                            fontWeight: FontWeight.bold,
                                            fontSize: size.height * .015,
                                          ),
                                        ),
                                      ),
                                      Obx(
                                        () => TextFormField(
                                          // cursorColor: CustomTheme.black,
                                          // controller: logincontroller.emailcontroller,
                                          onChanged: (value) {
                                            signUpController
                                                .onPhoneNoChange(value);
                                          },
                                          cursorHeight: 30,
                                          keyboardType: TextInputType.phone,
                                          maxLength: 10,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: size.height * .023,
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: size.height * .001,
                                          ),
                                          decoration: InputDecoration(
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal:
                                                        size.height * .01,
                                                    vertical:
                                                        size.height * .01),
                                            hintStyle: TextStyle(
                                                fontSize: size.height * .02,
                                                color: Colors.grey.shade500),
                                            filled: true,
                                            fillColor: Colors.white,
                                            errorText: signUpController
                                                    .phonenoerror.value.isEmpty
                                                ? null
                                                : signUpController
                                                    .phonenoerror.value,
                                            border: InputBorder.none,
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.redAccent,
                                                width: size.height * .002,
                                              ),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.redAccent,
                                                width: size.height * .002,
                                              ),
                                            ),
                                            enabledBorder:
                                                const OutlineInputBorder(
                                                    borderSide:
                                                        BorderSide.none),
                                            focusedBorder:
                                                const OutlineInputBorder(
                                                    borderSide:
                                                        BorderSide.none),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: size.width * .55,
                                  child: ElevatedButton.icon(
                                    onPressed: () async {
                                      // controller.validation(context, size);
                                      Get.close(1);
                                      signUpController.validations();
                                    },
                                    icon: Icon(
                                      // FontAwesomeIcons.arrowRight,
                                      color: Colors.white,
                                      Icons.arrow_right,
                                      size: size.height * .02,
                                      // color: CustomTheme.pinkish,
                                    ),
                                    label: Text(
                                      "Request OTP",
                                      style: GoogleFonts.merriweather(
                                        color: Colors.white,
                                        fontSize: size.height * .02,
                                        // color: CustomTheme.pinkish,
                                      ),
                                    ),
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
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ));
                    },
                  )
                ],
              )
            ],
          ),
        ),
      )),
    );
  }

  Future<Object?> signupotpverification() {
    var context = Get.context;
    Size size = MediaQuery.of(context!).size;
    SignUpController signUpController = Get.find();
    return showGeneralDialog(
      barrierDismissible: true,
      barrierLabel: "SignUp",
      context: context,
      pageBuilder: (context, _, __) => Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: size.height * .015),
          padding: EdgeInsets.symmetric(
              vertical: size.height * .012, horizontal: size.height * .04),
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
                      signUpController.phoneno.value,
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
                          signUpController.onotpchange(value);
                        },
                        style: TextStyle(
                          fontSize: size.height * .03,
                        ),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: size.height * .01,
                              vertical: size.height * .01),
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
                        signUpController.isLoading.value = false;
                        signUpController.onSignUp();
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
                Obx(() => SizedBox(
                      width: size.width * .7,
                      // height: size.height * .05,
                      child: ElevatedButton.icon(
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
                          signUpController.isLoading.value = true;
                          signUpController.otpVerify();
                        },
                        icon: signUpController.isLoading == true
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
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

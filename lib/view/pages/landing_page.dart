import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smarthome/controllers/landing_page_controller.dart';

class LandingPage extends GetView<LandingPageController> {
  // var controllerr = Get.put(LandingPageController());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned(
            // height: size.height * .3,
            width: size.width * .5,
            top: size.height * .65,
            right: size.width * .015,
            child: Container(
              height: size.height * .3,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [Colors.blue.shade300, Colors.blue.shade700],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
          ),
          Positioned(
            // height: size.height * .15,
            width: size.width * .5,
            top: size.height * .56,
            right: size.width * .2,
            child: Container(
              height: size.height * .2,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [Colors.purple.shade300, Colors.purple.shade700],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
          ),
          Positioned(
            // height: size.height * .3,
            width: size.width * .5,
            top: size.height * .65,
            right: size.width * .4,
            child: Container(
              height: size.height * .4,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [Colors.teal.shade300, Colors.teal.shade700],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 45,
                sigmaY: 45,
              ),
              child: const SizedBox(),
            ),
          ),
          //
          SafeArea(
              child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: size.width * .04, vertical: size.height * .05),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(.1),
                    borderRadius: BorderRadius.circular(
                      size.height * .01,
                    ),
                  ),
                  width: size.width * .9,
                  height: size.height * .85,
                  margin: EdgeInsets.symmetric(vertical: size.height * .05),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: size.height * .15,
                            child: Image.asset(
                              "assets/company_logo.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                          Text(
                            "sphinx worldbiz ltd",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.merriweather(
                              fontSize: size.height * .025,
                              color: Colors.blue.shade900,
                            ),
                          ),
                          Text(
                            "AN ISO 9001 27001 CERTIFIED COMPANY",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.merriweather(
                              fontSize: size.height * .015,
                            ),
                          )
                        ],
                      ),
                      Spacer(),
                      Text(
                        "Digital Transformation Technology",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.merriweather(
                          fontSize: size.height * .025,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}

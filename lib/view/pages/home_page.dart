import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:smarthome/controllers/homepage_controller.dart';
import 'package:smarthome/controllers/weather_details.controller.dart';

import '../../controllers/login_controller.dart';

class HomePage extends GetView<HomepageController> {
  WeatherDetailsController weathercontroller = Get.put(WeatherDetailsController());
  LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // var auth = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: EdgeInsets.all(size.height * .01),
            child: Obx(() => controller.lodingint.value == false
                ? Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            controller.name.toString() != "null" && controller.name.toString() != ""
                                // &&
                                // controller.name.toString() != null
                                ? "${controller.name.toString()}'s House"
                                : "User's House",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.merriweather(
                              fontWeight: FontWeight.bold,
                              fontSize: size.height * .025,
                            ),
                          ),
                          Spacer(),
                          IconButton(
                              onPressed: () {
                                FirebaseAuth.instance.signOut();
                                Get.offAndToNamed("/login");
                              },
                              icon: Icon(Icons.logout_outlined))
                        ],
                      ),
                      Card(
                        child: SizedBox(
                          height: size.height * .25,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    child: Column(
                                      children: [
                                        Text(
                                          DateFormat("EEEE, dd MMMM yyyy").format(
                                            DateTime.now(),
                                          ),
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.merriweather(
                                            color: CupertinoColors.systemGrey,
                                            fontSize: size.height * .015,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              weathercontroller.temp.toString(),
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.merriweather(
                                                fontWeight: FontWeight.bold,
                                                fontSize: size.height * .035,
                                              ),
                                            ),
                                            Text(
                                              "°c ${weathercontroller.weather}",
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.merriweather(
                                                fontWeight: FontWeight.bold,
                                                fontSize: size.height * .02,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    child: Image.network(
                                        "https://openweathermap.org/img/w/${weathercontroller.weathericonurl}.png",
                                        fit: BoxFit.fill,
                                        height: size.height * .1,
                                        width: size.width * .23),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    child: Column(
                                      children: [
                                        Text(
                                          "Humidity",
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.merriweather(
                                            color: CupertinoColors.systemGrey,
                                            fontSize: size.height * .02,
                                          ),
                                        ),
                                        Text(
                                          weathercontroller.humidity.toString(),
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.merriweather(
                                            fontWeight: FontWeight.bold,
                                            fontSize: size.height * .018,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    child: Column(
                                      children: [
                                        Text(
                                          "Pressure",
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.merriweather(
                                            color: CupertinoColors.systemGrey,
                                            fontSize: size.height * .02,
                                          ),
                                        ),
                                        Text(
                                          weathercontroller.pressure.toString(),
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.merriweather(
                                            fontWeight: FontWeight.bold,
                                            fontSize: size.height * .018,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    child: Column(
                                      children: [
                                        Text(
                                          "windspeed",
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.merriweather(
                                            color: CupertinoColors.systemGrey,
                                            fontSize: size.height * .02,
                                          ),
                                        ),
                                        Text(
                                          "${weathercontroller.windspeed} m/s",
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.merriweather(
                                            fontWeight: FontWeight.bold,
                                            fontSize: size.height * .018,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * .01,
                      ),
                      Card(
                        child: SizedBox(
                          // height: size.height * .6,
                          child: Column(
                            children: [
                              TabBar(
                                controller: controller.tabController,
                                labelColor: Colors.black,
                                indicatorColor: Colors.teal,
                                isScrollable: true,
                                tabs: [
                                  Tab(
                                    text: "Living room",
                                  ),
                                  Tab(
                                    text: "Bed room",
                                  ),
                                  Tab(
                                    text: "Living room",
                                  ),
                                  Tab(
                                    text: "Bath Room",
                                  ),
                                ],
                              ),
                              Container(
                                // color: Colors.red,
                                height: size.height * .53,
                                child: TabBarView(
                                  controller: controller.tabController,
                                  children: [
                                    SingleChildScrollView(
                                      child: Container(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Card(
                                                    shadowColor: Colors.teal,
                                                    surfaceTintColor: Colors.teal.shade100,
                                                    child: Container(
                                                      width: size.width * .4,
                                                      height: size.height * .23,
                                                      padding: EdgeInsets.all(size.height * .02),
                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                        children: [
                                                          Container(
                                                            decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(10),
                                                              color: Colors.grey.withOpacity(.3),
                                                            ),
                                                            child: Icon(
                                                              Icons.light,
                                                              size: size.height * .03,
                                                            ),
                                                          ),
                                                          Text(
                                                            "Master Switch",
                                                            textAlign: TextAlign.center,
                                                            style: GoogleFonts.merriweather(
                                                              fontWeight: FontWeight.bold,
                                                              fontSize: size.height * .02,
                                                            ),
                                                          ),
                                                          // Text(
                                                          //   "Living Room",
                                                          //   textAlign: TextAlign.center,
                                                          //   style: GoogleFonts.merriweather(
                                                          //     fontSize: size.height * .015,
                                                          //   ),
                                                          // ),

                                                          Obx(
                                                            () => Switch.adaptive(
                                                              value: controller.b5.value,
                                                              onChanged: (val) {
                                                                controller.onmasterbuttonpressed(val);
                                                                controller.onAnyValueUpdate();
                                                              },
                                                              activeColor: Colors.teal,
                                                              inactiveTrackColor: Colors.teal.shade100,
                                                              splashRadius: 50,
                                                            ),
                                                          )
                                                          // Obx(
                                                          //     () => SizedBox(
                                                          //       width: size.width * .4,
                                                          //       child: Slider(
                                                          //         onChanged: (val) {
                                                          //           controller.b1.value = val;
                                                          //         },
                                                          //         divisions: 10,
                                                          //         min: 0,
                                                          //         max: 100,
                                                          //         value: controller.b1.value as double,
                                                          //         activeColor: Colors.teal.shade200,
                                                          //         thumbColor: Colors.teal,
                                                          //       ),
                                                          //     ),
                                                          //   ),
                                                        ],
                                                      ),
                                                    )),
                                                Card(
                                                    shadowColor: Colors.teal,
                                                    surfaceTintColor: Colors.teal.shade100,
                                                    child: Container(
                                                      width: size.width * .4,
                                                      height: size.height * .23,
                                                      padding: EdgeInsets.all(size.height * .02),
                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                        children: [
                                                          Container(
                                                            decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(10),
                                                              color: Colors.grey.withOpacity(.3),
                                                            ),
                                                            child: Icon(
                                                              Icons.light,
                                                              size: size.height * .03,
                                                            ),
                                                          ),
                                                          Text(
                                                            "Smart Light 2",
                                                            textAlign: TextAlign.center,
                                                            style: GoogleFonts.merriweather(
                                                              fontWeight: FontWeight.bold,
                                                              fontSize: size.height * .02,
                                                            ),
                                                          ),
                                                          Text(
                                                            "Ambient lights",
                                                            textAlign: TextAlign.center,
                                                            style: GoogleFonts.merriweather(
                                                              fontSize: size.height * .015,
                                                            ),
                                                          ),
                                                          Obx(
                                                            () => Switch.adaptive(
                                                              value: controller.b4.value,
                                                              onChanged: (val) {
                                                                controller.b4.value = !controller.b4.value;
                                                                controller.onAnyValueUpdate();
                                                              },
                                                              activeColor: Colors.teal,
                                                              inactiveTrackColor: Colors.teal.shade100,
                                                              splashRadius: 50,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ))
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Card(
                                                    shadowColor: Colors.teal,
                                                    surfaceTintColor: Colors.teal.shade100,
                                                    child: Container(
                                                      width: size.width * .4,
                                                      height: size.height * .23,
                                                      padding: EdgeInsets.all(size.height * .02),
                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                        children: [
                                                          Container(
                                                            decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(10),
                                                              color: Colors.grey.withOpacity(.3),
                                                            ),
                                                            child: Icon(
                                                              Icons.light,
                                                              size: size.height * .03,
                                                            ),
                                                          ),
                                                          Text(
                                                            "Smart Light 3",
                                                            textAlign: TextAlign.center,
                                                            style: GoogleFonts.merriweather(
                                                              fontWeight: FontWeight.bold,
                                                              fontSize: size.height * .02,
                                                            ),
                                                          ),
                                                          Text(
                                                            "Ceiling lighting",
                                                            textAlign: TextAlign.center,
                                                            style: GoogleFonts.merriweather(
                                                              fontSize: size.height * .015,
                                                            ),
                                                          ),
                                                          Obx(
                                                            () => SizedBox(
                                                              width: size.width * .4,
                                                              child: Slider(
                                                                onChanged: (val) {
                                                                  controller.b1.value = val;
                                                                  controller.onAnyValueUpdate();
                                                                },
                                                                divisions: 10,
                                                                min: 0,
                                                                max: 100,
                                                                value: controller.b1.value,
                                                                activeColor: Colors.teal.shade200,
                                                                thumbColor: Colors.teal,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    )),
                                                Card(
                                                    shadowColor: Colors.teal,
                                                    surfaceTintColor: Colors.teal.shade100,
                                                    child: Container(
                                                      width: size.width * .4,
                                                      height: size.height * .23,
                                                      padding: EdgeInsets.all(size.height * .02),
                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                        children: [
                                                          Container(
                                                            decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(10),
                                                              color: Colors.grey.withOpacity(.3),
                                                            ),
                                                            child: Icon(
                                                              Icons.light,
                                                              size: size.height * .03,
                                                            ),
                                                          ),
                                                          Text(
                                                            "Smart Light 4",
                                                            textAlign: TextAlign.center,
                                                            style: GoogleFonts.merriweather(
                                                              fontWeight: FontWeight.bold,
                                                              fontSize: size.height * .02,
                                                            ),
                                                          ),
                                                          Text(
                                                            "Led",
                                                            textAlign: TextAlign.center,
                                                            style: GoogleFonts.merriweather(
                                                              fontSize: size.height * .015,
                                                            ),
                                                          ),
                                                          Obx(
                                                            () => SizedBox(
                                                              width: size.width * .4,
                                                              // height: size.height * .01,
                                                              child: Slider(
                                                                onChanged: (val) {
                                                                  controller.b2.value = val;
                                                                  controller.onAnyValueUpdate();
                                                                },
                                                                divisions: 10,
                                                                min: 0,
                                                                max: 100,
                                                                value: controller.b2.value,
                                                                activeColor: Colors.teal.shade200,
                                                                thumbColor: Colors.teal,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ))
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Card(
                                                    shadowColor: Colors.teal,
                                                    surfaceTintColor: Colors.teal.shade100,
                                                    child: Container(
                                                      width: size.width * .4,
                                                      height: size.height * .23,
                                                      padding: EdgeInsets.all(size.height * .02),
                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                        children: [
                                                          Container(
                                                            decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(10),
                                                              color: Colors.grey.withOpacity(.3),
                                                            ),
                                                            child: Icon(
                                                              Icons.light,
                                                              size: size.height * .03,
                                                            ),
                                                          ),
                                                          Text(
                                                            "Smart Light 5",
                                                            textAlign: TextAlign.center,
                                                            style: GoogleFonts.merriweather(
                                                              fontWeight: FontWeight.bold,
                                                              fontSize: size.height * .02,
                                                            ),
                                                          ),
                                                          Text(
                                                            "bed lights",
                                                            textAlign: TextAlign.center,
                                                            style: GoogleFonts.merriweather(
                                                              fontSize: size.height * .015,
                                                            ),
                                                          ),
                                                          Obx(
                                                            () => SizedBox(
                                                              width: size.width * .4,
                                                              // height: size.height * .01,
                                                              child: Slider(
                                                                onChanged: (val) {
                                                                  controller.b3.value = val;
                                                                  controller.onAnyValueUpdate();
                                                                },
                                                                divisions: 10,
                                                                min: 0,
                                                                max: 100,
                                                                value: controller.b3.value,
                                                                activeColor: Colors.teal.shade200,
                                                                thumbColor: Colors.teal,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    )),
                                                Container(
                                                  width: size.width * .4,
                                                  height: size.height * .23,
                                                  padding: EdgeInsets.all(size.height * .02),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(),
                                    Container(),
                                    Container(),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                : Center(child: CircularProgressIndicator.adaptive()))),
      ),
    );
  }
}

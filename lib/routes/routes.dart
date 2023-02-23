import 'package:get/get.dart';
import 'package:smarthome/binders/homepage_binder.dart';
import 'package:smarthome/binders/landing_page_binder.dart';
import 'package:smarthome/view/pages/home_page.dart';
import 'package:smarthome/view/pages/landing_page.dart';
import 'package:smarthome/view/pages/login_page.dart';

var routes = [
  GetPage(
    name: "/",
    page: () => LandingPage(),
    binding: LandingPageBinding(),
  ),
  GetPage(
    name: "/login",
    page: () => Login(),
    binding: LandingPageBinding(),
  ),
  GetPage(
    name: "/homepage",
    page: () => HomePage(),
    binding: HomepageBinder(),
  ),
  // GetPage(
  //   name: "/AddTodo",
  //   page: () => const AddTodo(),
  // ),
];

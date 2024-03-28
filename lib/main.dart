// ignore_for_file: depend_on_referenced_packages, prefer_const_constructors, must_be_immutable

import 'package:fe_grab_mobile/module/signin/login_page.dart';
import 'package:fe_grab_mobile/module/signin/unlogin_page.dart';
import 'package:fe_grab_mobile/module/signup/signup_mid.dart';
import 'package:fe_grab_mobile/share_widget/bot_navigator.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  runApp(DevicePreview(enabled: true, builder: ((context) => MyApp())));
  //runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  static Map<int, Color> color = {
    100: Color.fromARGB(1, 88, 188, 107),
    50: Color.fromARGB(1, 88, 188, 107),
    200: Color.fromARGB(1, 88, 188, 107),
    300: Color.fromARGB(1, 88, 188, 107),
    400: Color.fromARGB(1, 88, 188, 107),
    500: Color.fromARGB(1, 88, 188, 1070),
    600: Color.fromARGB(1, 88, 188, 107),
    700: Color.fromARGB(1, 88, 188, 107),
    800: Color.fromARGB(1, 88, 188, 107),
    900: Color.fromARGB(1, 88, 188, 107),
  };
  MaterialColor primeColor = MaterialColor(0xFF58BC6B, color);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grab Mobile',
      theme: ThemeData(
        primarySwatch: primeColor,
      ),
      initialRoute: "/unlogin",
      routes: <String, WidgetBuilder>{
        "/unlogin": (context) => const UnLoginPage(),
        "/login": (context) => const SignInPage(),
        "/mid-signup": (context) => const SignUpMidPage(),
        "/home": (context) => const BottomNavigatorBar(),
      },
    );
  }
}

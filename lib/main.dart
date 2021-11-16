import 'package:flutter/material.dart';
import 'package:strapi_first_try/login/login.dart';
import 'package:get/get.dart';
import 'package:strapi_first_try/splash/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.blue,
      ),
      home: const SplashView(),
    );
  }
}

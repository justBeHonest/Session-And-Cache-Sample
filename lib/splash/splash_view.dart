import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:strapi_first_try/core/auth_manager.dart';
import 'package:strapi_first_try/home/home_view.dart';
import 'package:strapi_first_try/home/model/user_model.dart';
import 'package:strapi_first_try/login/login.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final controller = Get.put(AuthManager());
  Future<void> controlToApp() async {
    await controller.fetchUserLogin();
    if (controller.isLogin.value) {
      await Future.delayed(Duration(seconds: 1));
      controller.model = UserModel.fake();
      Get.to(HomeView());
    } else {
      Get.to(Login());
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controlToApp();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}

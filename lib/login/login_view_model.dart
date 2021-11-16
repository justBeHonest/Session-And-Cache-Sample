import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:strapi_first_try/core/auth_manager.dart';
import 'package:strapi_first_try/core/cache_manager.dart';
import 'package:strapi_first_try/home/home_view.dart';
import 'package:strapi_first_try/home/model/user_model.dart';
import 'package:strapi_first_try/login/login.dart';
import 'package:strapi_first_try/login/model/user_request_model.dart';
import 'package:strapi_first_try/login/service/ilogin_service.dart';

abstract class LoginViewModel extends State<Login> with CacheManager {
  final controller = Get.put(AuthManager());
  late final LoginService loginService;
  final _baseUrl = 'https://reqres.in';
  @override
  void initState() {
    super.initState();
    final dio = Dio(BaseOptions(baseUrl: _baseUrl));
    dio.interceptors.add(PrettyDioLogger());
    loginService = LoginService(dio);
  }

  Future<void> fetchUserLogin(String email, String password) async {
    final response = await loginService
        .fetchLogin(UserRequestModel(email: email, password: password));
    if (response != null) {
      saveToken(response.token ?? '');
      navigateToHome();
      controller.model = UserModel.fake();
    }
  }

  void navigateToHome() {
    Get.to(HomeView());
  }
}

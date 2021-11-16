import 'package:get/get.dart';

import 'package:strapi_first_try/core/cache_manager.dart';
import 'package:strapi_first_try/home/model/user_model.dart';

class AuthManager extends GetxController {
  var isLogin = false.obs;
  UserModel? model;
  AuthManager({
    this.model,
  }) {
    fetchUserLogin();
  }

  Future<void> fetchUserLogin() async {
    CacheManager cm = CacheManager();
    final token = await cm.getToken();
    if (token != null) {
      isLogin.value = true;
    }
  }
}

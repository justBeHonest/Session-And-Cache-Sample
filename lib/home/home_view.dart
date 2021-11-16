import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:strapi_first_try/core/auth_manager.dart';
import 'package:strapi_first_try/core/cache_manager.dart';
import 'package:strapi_first_try/home/model/user_model.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with CacheManager {
  final controller = Get.put(AuthManager());
  String token = '';
  UserModel? userModel;

  void getTokenCache() async {
    token = await getToken() ?? '';
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userModel = controller.model;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${userModel?.name}')),
      body: Center(
        child: Column(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(userModel?.imageUrl ?? ''),
            ),
          ],
        ),
      ),
    );
  }
}

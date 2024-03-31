import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nowapps/model/utils/styles/colors.dart';
import 'package:nowapps/view/pages/retailers_page.dart/retailers_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'first_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    checkAuth();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: Center(
          child: Image.network("https://www.nowappstech.com/images/logo2.png")),
    );
  }

  Future<void> checkAuth() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool authUser = prefs.getBool("authUser") ?? false;
    await Future.delayed(const Duration(seconds: 5));
    authUser
        ? Get.to(() => const RetailersPage())
        : Get.to(() => const FirstPage());
  }
}

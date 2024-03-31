import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nowapps/model/service/add_to_cart_service.dart';
import 'package:nowapps/model/service/checkin_service.dart';
import 'package:nowapps/model/service/db_retailer_service.dart';
import 'package:nowapps/view/pages/loginpage/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await RetailerController().initDatabase();
  await CartController().initDatabase();
  await LocationControllerChekIn().initDatabase();
  Get.put(RetailerController());
  Get.put(CartController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'NowApps',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SplashScreen());
  }
}

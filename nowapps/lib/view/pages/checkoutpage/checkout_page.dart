import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nowapps/model/utils/const/sizedbox.dart';
import 'package:nowapps/model/utils/styles/colors.dart';
import 'package:nowapps/view/pages/cart/cart_page.dart';
import 'package:nowapps/view/pages/loginpage/first_page.dart';
import 'package:nowapps/view/pages/productlist/productlist_page.dart';
import 'package:nowapps/view/pages/retailers_page.dart/retailers_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 1, 3, 32),
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                onPressed: () {
                  logout();
                  Get.to(() => const FirstPage());
                },
                icon: const Icon(Icons.logout)),
          )
        ],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.to(() => const FirstPage()),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 60,
              width: 200,
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(blue)),
                  onPressed: () {
                    Get.to(() => const ProductListPage());
                  },
                  child: const Text(
                    "Book Order",
                    style: TextStyle(color: white),
                  )),
            ),
            kHeight10,
            SizedBox(
                height: 60,
                width: 200,
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(blue)),
                    onPressed: () {},
                    child: const Text(
                      "No Order",
                      style: TextStyle(color: white),
                    ))),
            kHeight10,
            SizedBox(
              height: 60,
              width: 200,
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(blue)),
                  onPressed: () {
                    if (check == true) {
                      Get.to(() => const RetailersPage());
                    } else {
                      Get.snackbar("Error", "Pls Order Products",
                          colorText: white,
                          snackPosition: SnackPosition.BOTTOM);
                    }
                  },
                  child: const Text(
                    "Checkout",
                    style: TextStyle(color: white),
                  )),
            ),
            kHeight10,
          ],
        ),
      ),
    );
  }

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("authUser", false);
  }
}

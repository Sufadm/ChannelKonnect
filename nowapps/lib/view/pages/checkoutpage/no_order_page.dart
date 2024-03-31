import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nowapps/model/utils/const/retailers_brand.dart';
import 'package:nowapps/model/utils/const/sizedbox.dart';
import 'package:nowapps/view/pages/checkoutpage/checkout_page.dart';

class NoOrderPage extends StatelessWidget {
  const NoOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(lottieImage),
          kHeight20,
          Text(
            "Retailers are  Not Availbale Today",
            style: GoogleFonts.lato(fontWeight: FontWeight.bold),
          ),
          kHeight20,
          ElevatedButton(
              onPressed: () {
                Get.to(() => const CheckoutPage());
              },
              child: const Text("Go back to Order Page"))
        ],
      ),
    );
  }
}

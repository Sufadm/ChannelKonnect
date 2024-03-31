import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nowapps/model/utils/styles/colors.dart';
import 'package:nowapps/view/pages/cart/cart_page.dart';
import 'package:nowapps/view/pages/checkoutpage/checkout_page.dart';
import 'package:nowapps/view/pages/productlist/productlist_page.dart';
import 'package:nowapps/viewmodel/location_model.dart';

PersistentBottomSheetController bottomSheets(
    BuildContext context, LocationModel currentLocation) {
  return showBottomSheet(
    context: context,
    builder: (context) => SizedBox(
      width: double.infinity,
      height: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton.icon(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue)),
              onPressed: () async {
                try {
                  check = false;
                  await currentLocation.getLocation();
                  await Future.delayed(const Duration(seconds: 2));
                  Get.to(() => const CheckoutPage());
                } catch (error) {
                  Get.snackbar(
                    snackPosition: SnackPosition.BOTTOM,
                    "Error",
                    "An error occurred. Please try again.",
                  );
                }
              },
              icon: const Icon(
                Icons.next_plan,
                color: white,
              ),
              label: const Text(
                "Check-In",
                style: TextStyle(color: Colors.white, fontSize: 12),
              ))
        ],
      ),
    ),
  );
}

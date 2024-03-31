import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nowapps/model/service/add_to_cart_service.dart';
import 'package:nowapps/model/utils/const/sizedbox.dart';
import 'package:nowapps/model/utils/styles/colors.dart';
import 'package:nowapps/view/components/button.dart';
import 'package:nowapps/view/pages/success/success_page.dart';

class CartPage extends StatelessWidget {
  const CartPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cartcontroller = Get.put(CartController());
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          GetBuilder<CartController>(
            builder: (controller) {
              if (controller.cartList.isEmpty) {
                return const Expanded(
                  child: Center(
                    child: Text(
                      "Your cart is empty",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                );
              } else {
                return Expanded(
                  child: ListView.builder(
                    itemCount: controller.cartList.length,
                    itemBuilder: (context, index) {
                      final data = controller.cartList[index];
                      var totalprice = data.price! * data.quantity!;
                      return Card(
                        child: SizedBox(
                          height: 100,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ListTile(
                                title: Text(
                                  data.name!,
                                  style: GoogleFonts.lato(),
                                ),
                                leading: const CircleAvatar(
                                  radius: 25,
                                  backgroundImage: NetworkImage(images),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Price: ${totalprice.toString()}",
                                      style: GoogleFonts.lato(),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Quantity: ${data.quantity.toString()}",
                                          style: GoogleFonts.lato(),
                                        ),
                                        InkWell(
                                          onTap: () async {
                                            Get.defaultDialog(
                                              title: "Confirmation",
                                              content: const Text(
                                                "Are you sure you want to remove this item?",
                                              ),
                                              textConfirm: "Remove",
                                              onConfirm: () {
                                                controller
                                                    .deleteCartItem(index);
                                                Get.back();
                                              },
                                              textCancel: "Cancel",
                                              onCancel: () {
                                                // Get.back();
                                              },
                                            );
                                          },
                                          child: Text(
                                            "Remove",
                                            style: GoogleFonts.lato(
                                              color: Colors.blue,
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              }
            },
          ),
          if (cartcontroller.cartList.isNotEmpty)
            SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GetBuilder<CartController>(
                    builder: (controller) {
                      var totalAmount = 0.0;
                      var totalQuantity = 0;
                      for (var item in controller.cartList) {
                        totalAmount += item.price! * item.quantity!;
                        totalQuantity += item.quantity!;
                      }
                      return cartcontroller.cartList.isNotEmpty
                          ? Card(
                              child: Container(
                                height: 70,
                                width: double.infinity,
                                color: white,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Total Quantity: $totalQuantity",
                                        style: GoogleFonts.lato(fontSize: 15),
                                      ),
                                      Text(
                                        "Total Amount: ${totalAmount.toStringAsFixed(2)}",
                                        style: GoogleFonts.lato(fontSize: 16),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          : const SizedBox();
                    },
                  ),
                  Obx(() => cartcontroller.cartList.isNotEmpty
                      ? SizedBox(
                          height: 50,
                          child: Button(
                            text: "Place order",
                            ontap: () {
                              Get.to(const SuccessPage());
                            },
                            color: blue,
                          ),
                        )
                      : const SizedBox()),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

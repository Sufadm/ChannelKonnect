import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:nowapps/model/service/add_to_cart_service.dart';
import 'package:nowapps/model/utils/const/sizedbox.dart';
import 'package:nowapps/model/utils/styles/colors.dart';
import 'package:nowapps/view/components/button.dart';
import 'package:nowapps/view/pages/success/success_page.dart';
import 'package:nowapps/viewmodel/counter_product.dart';

class CartPage extends StatelessWidget {
  const CartPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(CounterController());
    CounterController countercontroller = Get.find();
    final cartcontroller = Get.put(CartController());
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          GetBuilder<CartController>(
            builder: (controller) {
              if (controller.cartList.isEmpty) {
                return Expanded(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Lottie.network(
                            "https://lottie.host/32a9a369-8fce-4018-912a-ebe228d5666c/YpgngkdIcE.json"),
                        Text("Your cart is empty",
                            style: GoogleFonts.lato(fontSize: 18)),
                      ],
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
                                                Get.snackbar(
                                                    "${controller.cartList[index].name}",
                                                    "removed",
                                                    duration: const Duration(
                                                        milliseconds: 1000));
                                              },
                                              textCancel: "Cancel",
                                              onCancel: () {},
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
                                    ),
                                    Row(
                                      children: [
                                        IconButton(
                                          icon: const Icon(Icons.remove),
                                          onPressed: () async {
                                            await Future.delayed(const Duration(
                                                milliseconds: 500));
                                            int currentQuantity = controller
                                                    .cartList[index].quantity ??
                                                0;

                                            if (currentQuantity > 0) {
                                              int newQuantity =
                                                  currentQuantity - 1;

                                              await controller
                                                  .updateCartItemQuantity(
                                                      controller
                                                          .cartList[index].id!,
                                                      newQuantity);

                                              Get.snackbar("Removed",
                                                  "1 product removed",
                                                  duration: const Duration(
                                                      milliseconds: 1000));
                                            }
                                          },
                                        ),
                                        Center(
                                          child: Obx(
                                            () => Text(
                                              controller
                                                  .cartList[index].quantity
                                                  .toString(),
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                        IconButton(
                                          icon: const Icon(Icons.add),
                                          onPressed: () async {
                                            await Future.delayed(const Duration(
                                                milliseconds: 500));

                                            int currentQuantity = controller
                                                    .cartList[index].quantity ??
                                                0;
                                            int newQuantity =
                                                currentQuantity + 1;

                                            await controller
                                                .updateCartItemQuantity(
                                                    controller
                                                        .cartList[index].id!,
                                                    newQuantity);
                                            Get.snackbar(
                                                "Added", "1 product added",
                                                duration: const Duration(
                                                    milliseconds: 1000));
                                          },
                                        ),
                                      ],
                                    ),
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
                              Get.to(() => const SuccessPage());
                              check = true;
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

bool check = false;

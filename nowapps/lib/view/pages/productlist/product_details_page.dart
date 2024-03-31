import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nowapps/model/data/add_to_cart_model.dart';
import 'package:nowapps/model/service/add_to_cart_service.dart';
import 'package:nowapps/model/utils/const/retailers_brand.dart';
import 'package:nowapps/view/components/button.dart';
import 'package:nowapps/view/components/products_counts.dart';
import 'package:nowapps/viewmodel/counter_product.dart';
import 'package:nowapps/viewmodel/product_controller.dart';

class ProductDetailsPage extends StatelessWidget {
  final int index;
  const ProductDetailsPage({
    super.key,
    required this.index,
  });
  @override
  Widget build(BuildContext context) {
    ProductController controller = Get.find();
    final counter = Get.put(CounterController());
    final cartController = Get.find<CartController>();

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 400,
                      width: double.infinity,
                      child: Image.network(
                        repeatedImages[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      controller.products[index].prodName.toString(),
                      style: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Container(
                          width: 50,
                          color: Colors.green,
                          child: const Center(child: Text("4.2")),
                        ),
                        const SizedBox(width: 10),
                        const Text("2,654 Ratings & 278 Reviews")
                      ],
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "Special Price",
                      style: GoogleFonts.lato(color: Colors.green),
                    ),
                    Row(
                      children: [
                        Text(
                          "₹${controller.products[index].prodRkPrice.toString()}",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 25),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                          ),
                          child: CounterWidget(index: index),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 50,
            child: Button(
              text: "Add to cart",
              ontap: () async {
                final existingCartItem =
                    cartController.cartList.firstWhereOrNull(
                  (item) => item.name == controller.products[index].prodName,
                );
                if (existingCartItem == null && counter.counters[index] > 0) {
                  Get.back();
                  final model2 = AddToCartModel(
                    name: controller.products[index].prodName,
                    quantity: counter.counters[index],
                    price: double.tryParse(controller
                            .products[index].prodRkPrice
                            .toString()) ??
                        0.0,
                  );
                  cartController.addcartList(model2);
                  Get.snackbar("Ok", "Product added to cart",
                      snackPosition: SnackPosition.BOTTOM,
                      duration: const Duration(seconds: 1));
                } else if (counter.counters[index] < 1) {
                  Get.snackbar("Pls", "add quantity",
                      duration: const Duration(seconds: 1));
                } else {
                  Get.snackbar("Added", "product already added in cart");
                }
              },
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}

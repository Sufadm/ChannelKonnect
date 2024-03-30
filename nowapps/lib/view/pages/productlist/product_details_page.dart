import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nowapps/model/data/add_to_cart_model.dart';
import 'package:nowapps/model/service/add_to_cart_service.dart';
import 'package:nowapps/model/utils/const/sizedbox.dart';
import 'package:nowapps/model/utils/styles/colors.dart';
import 'package:nowapps/view/components/button.dart';
import 'package:nowapps/view/components/products_counts.dart';
import 'package:nowapps/view/pages/cart/cart_page.dart';
import 'package:nowapps/viewmodel/counter_product.dart';

import '../../../viewmodel/product_controller.dart';

class ProductDetailsPage extends StatelessWidget {
  final int index;
  const ProductDetailsPage({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    ProductController controller = Get.find();
    final data = controller.products[index];

    final counter = Get.put(CounterController());
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
                        "https://img.freepik.com/premium-photo/young-bearded-man-model-fashion-sitting-urban-step-wearing-casual-clothes_1139-1325.jpg?size=626&ext=jpg&ga=GA1.1.1827530304.1711584000&semt=ais",
                        fit: BoxFit.cover,
                        // height: 300,
                        // width: 300,
                      ),
                    ),
                    kHeight10,
                    Text(
                      controller.products[index].prodName.toString(),
                      style: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    kHeight10,
                    Row(
                      children: [
                        Container(
                          width: 50,
                          color: Colors.green,
                          child: const Center(child: Text("4.2")),
                        ),
                        kWidth10,
                        const Text("2,654 Ratings & 278 Reviews")
                      ],
                    ),
                    kHeight5,
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
                        kWidth25,
                        Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: black),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                            ),
                            child: CounterWidget(index: index))
                      ],
                    ),
//                    const Text("Sdsd"),
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
                print(controller.products[index].prodRkPrice);

                final model2 = AddToCartModel(
                  name: controller.products[index].prodName,
                  quantity: counter.counters[index],
                  price: double.tryParse(
                          controller.products[index].prodRkPrice.toString()) ??
                      0.0,
                );

                CartController cartController = Get.find<CartController>();

                cartController.addcartList(model2);
                // Get.back();
                // Get.to(CartPage(
                //   index: index,
                // ));
              },
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}

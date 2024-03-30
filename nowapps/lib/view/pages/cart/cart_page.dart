import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nowapps/model/utils/const/sizedbox.dart';
import 'package:nowapps/model/utils/styles/colors.dart';
import 'package:nowapps/viewmodel/product_controller.dart';

class CartPage extends StatelessWidget {
  final int index;
  const CartPage({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    ProductController prodController = Get.find();
    final data = prodController.products[index];
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: const Color.fromARGB(255, 240, 239, 238),
              child: SizedBox(
                width: double.infinity,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          color: Colors.amber,
                          child: Image.network(
                            "https://img.freepik.com/premium-photo/young-bearded-man-model-fashion-sitting-urban-step-wearing-casual-clothes_1139-1325.jpg?size=626&ext=jpg&ga=GA1.1.1827530304.1711584000&semt=ais",
                            width: 150,
                            fit: BoxFit.fill,
                          ),
                        ),
                        kHeight10,
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        //  CounterWidget(index: index),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(prodController.products[index].prodName
                              .toString()),
                          kHeight5,
                          Text(
                            "Quantity: 10",
                            style: GoogleFonts.lato(),
                          ),
                          Row(
                            children: [
                              const Text(
                                "90%off",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              kWidth10,
                              const Text(
                                "1200",
                                style: TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    fontStyle: FontStyle.italic),
                              ),
                              kWidth5,
                              Text(
                                "₹${data.prodRkPrice}",
                                style: GoogleFonts.lato(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          kWidth10,
                          InkWell(
                              onTap: () {},
                              child: Text(" Remove",
                                  style: GoogleFonts.lato(color: blue))),
                          // TextButton(
                          //   onPressed: () {},
                          //   child: const Text("REMOVE"),
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            kHeight10,
          ],
        ),
      ),
    );
  }
}

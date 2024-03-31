import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nowapps/model/service/add_to_cart_service.dart';
import 'package:nowapps/model/utils/const/sizedbox.dart';
import 'package:nowapps/model/utils/styles/colors.dart';
import 'package:nowapps/view/components/button.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CartController());
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          GetBuilder<CartController>(
            builder: (controller) {
              return Expanded(
                child: ListView.builder(
                    itemCount: controller.cartList.length,
                    itemBuilder: (context, index) {
                      final data = controller.cartList[index];
                      return Card(
                        child: ListTile(
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
                                data.price.toString(),
                                style: GoogleFonts.lato(),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Quantity:${data.quantity.toString()}",
                                    style: GoogleFonts.lato(),
                                  ),
                                  Text(
                                    "Remove",
                                    style: GoogleFonts.lato(color: blue),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              );
            },
          ),
          SizedBox(
            height: 50,
            child: Button(
              text: "Place order",
              ontap: () {},
              color: blue,
            ),
          )
        ],
      ),
    );
  }
}

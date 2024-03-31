import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nowapps/model/service/add_to_cart_service.dart';
import 'package:nowapps/model/utils/const/sizedbox.dart';
import 'package:nowapps/model/utils/styles/colors.dart';
import 'package:nowapps/view/pages/cart/cart_page.dart';
import 'package:nowapps/view/pages/productlist/product_details_page.dart';
import 'package:nowapps/viewmodel/product_controller.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProductController());
    Get.put(CartController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () => Get.to(const CartPage()),
          )
        ],
      ),
      body: GetBuilder<ProductController>(
        builder: (controller) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: controller.isLoading.value
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : controller.products.isEmpty
                        ? const Center(
                            child: Text('No products available'),
                          )
                        : GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2),
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              final product = controller.products[index];
                              final isSelected =
                                  controller.selectedProducts.contains(product);
                              return InkWell(
                                onTap: () {
                                  Get.to(ProductDetailsPage(
                                    index: index,
                                  ));
                                },
                                child: Card(
                                  color: isSelected
                                      ? const Color.fromARGB(255, 238, 233, 233)
                                      : Colors.white,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(color: black),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Image.network(
                                          "https://img.freepik.com/premium-photo/young-bearded-man-model-fashion-sitting-urban-step-wearing-casual-clothes_1139-1325.jpg?size=626&ext=jpg&ga=GA1.1.1827530304.1711584000&semt=ais",
                                          fit: BoxFit.cover,
                                          height: 100,
                                          width: double.infinity,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                product.prodName!,
                                                overflow: TextOverflow.visible,
                                                style: GoogleFonts.lato(),
                                              ),
                                              kHeight5,
                                              Text(
                                                "₹${product.prodRkPrice!}",
                                                style: GoogleFonts.lato(
                                                    fontWeight:
                                                        FontWeight.bold),
                                                overflow: TextOverflow.visible,
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

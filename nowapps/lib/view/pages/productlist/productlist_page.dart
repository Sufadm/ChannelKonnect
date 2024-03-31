import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nowapps/view/pages/cart/cart_page.dart';
import 'package:nowapps/view/pages/checkoutpage/checkout_page.dart';
import 'package:nowapps/view/pages/productlist/product_details_page.dart';
import 'package:nowapps/viewmodel/product_controller.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProductController());

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.to(() => const CheckoutPage()),
        ),
        title: const Text('Product List'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () => Get.to(() => const CartPage()),
          ),
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
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: _crossAxisCount(context),
                              childAspectRatio: _aspectRatio(context),
                            ),
                            itemCount: controller.products.length,
                            itemBuilder: (context, index) {
                              final product = controller.products[index];
                              final isSelected =
                                  controller.selectedProducts.contains(product);
                              return InkWell(
                                onTap: () {
                                  Get.to(
                                    () => ProductDetailsPage(
                                      index: index,
                                    ),
                                  );
                                },
                                child: Card(
                                  color: isSelected
                                      ? const Color.fromARGB(255, 238, 233, 233)
                                      : Colors.white,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Image.network(
                                            "https://img.freepik.com/premium-photo/young-bearded-man-model-fashion-sitting-urban-step-wearing-casual-clothes_1139-1325.jpg?size=626&ext=jpg&ga=GA1.1.1827530304.1711584000&semt=ais",
                                            fit: BoxFit.cover,
                                            width: double.infinity,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                product.prodName!,
                                                style: GoogleFonts.lato(),
                                              ),
                                              const SizedBox(height: 5),
                                              Text(
                                                "₹${product.prodRkPrice!}",
                                                style: GoogleFonts.lato(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
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

  int _crossAxisCount(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth > 1200) {
      return 4;
    } else if (screenWidth > 800) {
      return 3;
    } else if (screenWidth > 400) {
      return 2;
    } else {
      return 1;
    }
  }

  double _aspectRatio(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return screenWidth > 600 ? 0.8 : 1;
  }
}

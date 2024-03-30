import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nowapps/model/utils/const/sizedbox.dart';
import 'package:nowapps/model/utils/styles/colors.dart';
import 'package:nowapps/view/components/button.dart';
import 'package:nowapps/view/pages/selectedproduct/selected_product_list.dart';
import 'package:nowapps/viewmodel/product_controller.dart';
import 'package:nowapps/viewmodel/selected_count.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool select = false;
    Get.put(ProductController());
    final SelectedProductCount selectedProductCount =
        Get.put(SelectedProductCount());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
      ),
      body: GetBuilder<ProductController>(
        builder: (controller) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                margin: const EdgeInsets.only(left: 15),
                child:
                    Text("Selected Products: ${selectedProductCount.count} ")),
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
                            itemCount: controller.products.length,
                            itemBuilder: (context, index) {
                              final product = controller.products[index];
                              final isSelected =
                                  controller.selectedProducts.contains(product);
                              return InkWell(
                                onTap: () {
                                  if (select == true &&
                                      controller.selectedProducts.isNotEmpty) {
                                    controller.toggleProductSelection(product);
                                  } else if (controller
                                      .selectedProducts.isEmpty) {
                                    select = false;
                                  }
                                },
                                onLongPress: () {
                                  if (controller.selectedProducts.isEmpty) {
                                    controller.toggleProductSelection(product);
                                    select = true;
                                  }
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
                                          "https://www.bigbasket.com/media/uploads/p/xxl/40318754_2-lindberg-lindberg-luxury-delights-assorted-centre-filled-chocolate-truffles-gift-box-4pc-46g.jpg",
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
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Button(
                text: "Add Selected Products",
                color: blue,
                ontap: () {
                  Get.to(SelectedProductListPage(
                    selectedProducts: controller.selectedProducts,
                  ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

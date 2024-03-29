import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nowapps/model/data/product_model.dart';
import 'package:nowapps/model/service/product_service.dart';
import 'package:nowapps/model/utils/styles/colors.dart';
import 'package:nowapps/view/components/button.dart';
import 'package:nowapps/view/pages/selectedproduct/selected_product_list.dart';
import 'package:nowapps/viewmodel/product_controller.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProductController());
    ProductService().fetchProducts();
    return GetBuilder<ProductController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: const Text('Product List'),
        ),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: controller.isLoading.value
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : controller.products.isEmpty
                      ? const Center(
                          child: Text('No products available'),
                        )
                      : ListView.builder(
                          itemCount: controller.products.length,
                          itemBuilder: (context, index) {
                            final product = controller.products[index];
                            final isSelected =
                                controller.selectedProducts.contains(product);
                            return InkWell(
                              onTap: () {
                                controller.toggleProductSelection(product);
                              },
                              child: Card(
                                color: isSelected
                                    ? const Color.fromARGB(255, 238, 233, 233)
                                    : Colors.white,
                                child: ListTile(
                                  selected: controller.selectedProducts
                                      .contains(product),
                                  leading: Image.network(
                                      "https://www.bigbasket.com/media/uploads/p/xxl/40318754_2-lindberg-lindberg-luxury-delights-assorted-centre-filled-chocolate-truffles-gift-box-4pc-46g.jpg"),
                                  trailing: Text("₹${product.prodRkPrice!}"),
                                  title: Text(
                                    product.prodName.toString(),
                                    style: GoogleFonts.lato(),
                                  ),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(product.prodBuy.toString()),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
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

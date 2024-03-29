// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:nowapps/model/service/product_service.dart';
// import 'package:nowapps/model/utils/styles/colors.dart';
// import 'package:nowapps/view/components/button.dart';
// import 'package:nowapps/viewmodel/product_controller.dart';

// class ProductListPage extends StatelessWidget {
//   const ProductListPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final ProductController productController = Get.put(ProductController());
//     ProductService().fetchProducts();
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Product List'),
//       ),
//       body: Stack(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Obx(() {
//               if (productController.isLoading.value) {
//                 return const Center(
//                   child: CircularProgressIndicator(),
//                 );
//               } else if (productController.products.isEmpty) {
//                 return const Center(
//                   child: Text('No products available'),
//                 );
//               } else {
//                 return ListView.builder(
//                   itemCount: productController.products.length,
//                   itemBuilder: (context, index) {
//                     final product = productController.products[index];
//                     return Card(
//                       child: ListTile(
//                         leading: Image.network(
//                             "https://www.bigbasket.com/media/uploads/p/xxl/40318754_2-lindberg-lindberg-luxury-delights-assorted-centre-filled-chocolate-truffles-gift-box-4pc-46g.jpg"),
//                         trailing: Text("₹${product.prodRkPrice!}"),
//                         title: Text(
//                           product.prodName.toString(),
//                           style: GoogleFonts.lato(),
//                         ),
//                         subtitle: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(product.prodBuy.toString()),
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                 );
//               }
//             }),
//           ),
//           Positioned(
//             left: 5,
//             right: 5,
//             bottom: 0,
//             child: Button(
//               text: "Add Products",
//               color: blue,
//               ontap: () {},
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nowapps/model/service/product_service.dart';
import 'package:nowapps/model/utils/styles/colors.dart';
import 'package:nowapps/view/components/button.dart';
import 'package:nowapps/viewmodel/product_controller.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductController productController = Get.put(ProductController());
    ProductService().fetchProducts();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Obx(() {
              if (productController.isLoading.value) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (productController.products.isEmpty) {
                return const Center(
                  child: Text('No products available'),
                );
              } else {
                return ListView.builder(
                  itemCount: productController.products.length,
                  itemBuilder: (context, index) {
                    final product = productController.products[index];
                    return InkWell(
                      onLongPress: () {
                        productController.toggleProductSelection(product);
                      },
                      child: Card(
                        child: ListTile(
                          selected: productController.selectedProducts
                              .contains(product),
                          leading: Image.network(
                              "https://www.bigbasket.com/media/uploads/p/xxl/40318754_2-lindberg-lindberg-luxury-delights-assorted-centre-filled-chocolate-truffles-gift-box-4pc-46g.jpg"),
                          trailing: Text("₹${product.prodRkPrice!}"),
                          title: Text(
                            product.prodName.toString(),
                            style: GoogleFonts.lato(),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(product.prodBuy.toString()),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              }
            }),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Button(
              text: "Add Selected Products",
              color: blue,
              ontap: () {},
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:nowapps/model/data/product_model.dart';
import 'package:nowapps/model/utils/styles/colors.dart';
import 'package:nowapps/view/components/button.dart';

class SelectedProductListPage extends StatelessWidget {
  final List<Product> selectedProducts;

  const SelectedProductListPage({super.key, required this.selectedProducts});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            selectedProducts.isEmpty
                ? const Center(
                    child: Text("No Selected Products"),
                  )
                : Expanded(
                    child: ListView.builder(
                      itemCount: selectedProducts.length,
                      itemBuilder: (context, index) {
                        final product = selectedProducts[index];
                        return Card(
                          child: ListTile(
                            trailing: Text('₹${product.prodRkPrice!}'),
                            leading: Image.network(
                                "https://www.bigbasket.com/media/uploads/p/xxl/40318754_2-lindberg-lindberg-luxury-delights-assorted-centre-filled-chocolate-truffles-gift-box-4pc-46g.jpg"),
                            title: Text(product.prodName.toString()),
                            subtitle: Text("Price: ₹${product.prodRkPrice!}"),
                          ),
                        );
                      },
                    ),
                  ),
            if (selectedProducts.isNotEmpty)
              Button(
                text: "Order place",
                ontap: () {},
                color: blue,
              )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nowapps/model/service/add_to_cart_service.dart';
import 'package:nowapps/model/utils/const/sizedbox.dart';
import 'package:nowapps/view/pages/checkoutpage/no_order_page.dart';
import 'package:nowapps/view/pages/success/widgets/custom_bottom.dart';

class SuccessPage extends StatefulWidget {
  const SuccessPage({super.key});

  @override
  _SuccessPageState createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return const CustomBottomSheet();
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    CartController cartcontroller = Get.find();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.to(() => const NoOrderPage());
              cartcontroller.deleteCartItemAll();
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cartcontroller.cartList.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Card(
                        child: ListTile(
                          leading: Image.network(images),
                          title: Text(
                              cartcontroller.cartList[index].name.toString()),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Quantity:${cartcontroller.cartList[index].quantity.toString()}",
                              ),
                              Text(
                                  "Price:${cartcontroller.cartList[index].price.toString()}"),
                            ],
                          ),
                          trailing: const Icon(
                            Icons.check_box,
                            color: Colors.green,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

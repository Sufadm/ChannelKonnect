import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:nowapps/model/service/add_to_cart_service.dart';
import 'package:nowapps/model/utils/const/sizedbox.dart';
import 'package:nowapps/view/pages/productlist/productlist_page.dart';

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
              Get.to(() => const ProductListPage());
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

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      padding: EdgeInsets.all(screenWidth * 0.04),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Order Placed Successfully',
            style: TextStyle(
              fontSize: screenWidth * 0.06,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: screenHeight * 0.015),
          Text(
            'Thank you',
            style: TextStyle(fontSize: screenWidth * 0.04),
          ),
          SizedBox(height: screenHeight * 0.03),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.network(
                "https://assets3.lottiefiles.com/packages/lf20_xwmj0hsk.json",
                height: screenHeight * 0.4,
                width: screenWidth * 0.8,
              )
            ],
          ),
        ],
      ),
    );
  }
}

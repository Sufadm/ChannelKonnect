import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

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

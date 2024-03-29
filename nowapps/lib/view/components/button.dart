import 'package:flutter/material.dart';
import 'package:nowapps/model/utils/styles/textstyles.dart';

class Button extends StatelessWidget {
  final Color? color;
  final String text;
  final VoidCallback ontap;
  const Button({
    super.key,
    this.color,
    required this.text,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(color),
              shape: MaterialStateProperty.all(const BeveledRectangleBorder())),
          onPressed: ontap,
          child: Text(
            text,
            style: latoW,
          )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:nowapps/model/utils/const/sizedbox.dart';
import 'package:nowapps/model/utils/styles/colors.dart';
import 'package:nowapps/view/components/button.dart';
import 'package:nowapps/view/components/textform.dart';
import 'package:nowapps/view/pages/checkin/checkin_page.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final locationController = TextEditingController();
    final addressController = TextEditingController();
    final phoneNumberController = TextEditingController();
    final formkey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blue,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formkey,
            child: Column(
              children: [
                kHeight25,
                Image.network(
                  "https://lh3.googleusercontent.com/p/AF1QipPbO7nDDLGiZY2Yo2T9EfNhaTRzgA1ugArf8983=s1360-w1360-h1020",
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  height: 35,
                ),
                Textform(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter name';
                    }
                    return null;
                  },
                  controller: nameController,
                  hintText: 'Name',
                  onTap: () {},
                ),
                kHeight10,
                Textform(
                  validator: (value) => value!.isEmpty ? "Enter Email" : null,
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  hintText: 'Email',
                  onTap: () {},
                ),
                kHeight10,
                Textform(
                  validator: (value) =>
                      value!.isEmpty ? "Enter Location" : null,
                  controller: locationController,
                  hintText: 'Location',
                  onTap: () {},
                ),
                kHeight10,
                Textform(
                  validator: (value) => value!.isEmpty ? "Enter Address" : null,
                  maxLines: 3,
                  controller: addressController,
                  hintText: 'Address',
                  onTap: () {},
                ),
                kHeight10,
                Textform(
                  validator: (value) =>
                      value!.isEmpty ? "Enter PhoneNumber" : null,
                  maxLength: 10,
                  keyboardType: TextInputType.number,
                  controller: phoneNumberController,
                  hintText: 'Phone Number',
                  onTap: () {},
                ),
                kHeight10,
                //button
                Button(
                  ontap: () {
                    Get.to(const CheckInPage());
                    // if (formkey.currentState!.validate()) {
                    //   Get.off(const CheckInPage());
                    // } else {
                    //   Get.snackbar(
                    //     snackPosition: SnackPosition.BOTTOM,
                    //     "Error",
                    //     "Please fill out all required fields correctly",
                    //   );
                    // }
                  },
                  text: "Next",
                  color: blue,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
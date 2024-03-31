import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nowapps/main.dart';
import 'package:nowapps/model/utils/const/sizedbox.dart';
import 'package:nowapps/model/utils/styles/colors.dart';
import 'package:nowapps/view/components/add_form_data_text.dart';
import 'package:nowapps/view/components/button.dart';
import 'package:nowapps/view/components/textform.dart';
import 'package:nowapps/view/pages/retailers_page.dart/retailers_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  @override
  Widget build(BuildContext context) {
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
                ),
                kHeight10,
                Textform(
                  validator: (value) {
                    if (value!.isEmpty) {
                      const Text("Enter Email");
                    }
                    if (!isValidEmail(value)) {
                      return 'Invalid email format';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  hintText: 'Email',
                ),
                kHeight10,
                Textform(
                  validator: (value) =>
                      value!.isEmpty ? "Enter Location" : null,
                  controller: locationController,
                  hintText: 'Location',
                ),
                kHeight10,
                Textform(
                  validator: (value) => value!.isEmpty ? "Enter Address" : null,
                  maxLines: 3,
                  controller: addressController,
                  hintText: 'Address',
                ),
                kHeight10,
                Textform(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Phone Number";
                    } else if (!isValidPhoneNumber(value)) {
                      return "Enter a valid Phone Number";
                    } else {
                      return null;
                    }
                  },
                  maxLength: 10,
                  keyboardType: TextInputType.number,
                  controller: phoneNumberController,
                  hintText: 'Phone Number',
                ),

                kHeight10,
                //button
                Button(
                  ontap: () async {
                    if (formkey.currentState!.validate()) {
                      await addretailer(context);
                      initSharedPreferences();
                      Get.offAll(() => const RetailersPage());
                    }
                  },
                  text: "Submit",
                  color: blue,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool isValidPhoneNumber(String? value) {
    RegExp regex = RegExp(r'^[6-9]\d{9}$');
    return regex.hasMatch(value ?? '');
  }

  bool isValidEmail(String email) {
    final emailRegex = RegExp(
        r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$');
    return emailRegex.hasMatch(email);
  }

  Future<void> initSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("authUser", true);
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nowapps/model/utils/const/sizedbox.dart';
import 'package:nowapps/model/utils/styles/colors.dart';
import 'package:nowapps/view/components/add_form_data_text.dart';
import 'package:nowapps/view/components/button.dart';
import 'package:nowapps/view/components/textform.dart';
import 'package:nowapps/view/pages/checkin/checkin_page.dart';
import 'package:nowapps/view/pages/retailers_page.dart/retailers_page.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

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
                  validator: (value) => value!.isEmpty ? "Enter Email" : null,
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
                  // prefix: "+91 ",
                  maxLength: 10,
                  keyboardType: TextInputType.number,
                  controller: phoneNumberController,
                  hintText: 'Phone Number',
                ),

                kHeight10,
                //button
                Button(
                  ontap: () async {
                    await addretailer(context);
                    if (formkey.currentState!.validate()) {
                      Get.to(const RetailersPage());
                    }
                    // Get.to(CheckInPage(
                    //     name: nameController.text,
                    //     email: emailController.text,
                    //     location: locationController.text,
                    //     address: addressController.text,
                    //     phoneNumber: phoneNumberController.text)

                    //     );
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

  bool isValidPhoneNumber(String? value) {
    RegExp regex = RegExp(r'^[6-9]\d{9}$');
    return regex.hasMatch(value ?? '');
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nowapps/model/utils/styles/colors.dart';
import 'package:nowapps/view/components/add_form_data_text.dart';
import 'package:nowapps/viewmodel/location_model.dart';

class CheckInPage extends StatelessWidget {
  final String name;
  final String email;
  final String location;
  final String address;
  final String phoneNumber;
  const CheckInPage(
      {super.key,
      required this.name,
      required this.email,
      required this.location,
      required this.address,
      required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    final currentLocation = Get.put(LocationModel());
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 55,
            ),
            const Text(
              "Welcome to ChannelKonnect",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const Center(
              child: Text(
                "Pls Check-In",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Image.network(
              "https://miro.medium.com/v2/resize:fit:1358/1*wq9OxfN7_h2EripMmOn5xw.png",
            ),
            const SizedBox(
              height: 45,
            ),
            ElevatedButton.icon(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue)),
                onPressed: () async {
                  await currentLocation.getLocation();
                  await Future.delayed(const Duration(seconds: 5));
                  print(currentLocation.currentAddress);
                  addretailer(context);

                  // print(name);

                  // if (formkey.currentState!.validate()) {
                  //   await addretailer(context);
                  // } else {
                  //   Get.snackbar(
                  //     snackPosition: SnackPosition.BOTTOM,
                  //     "Error",
                  //     "pls try again",
                  //   );
                  // }
                },
                icon: const Icon(
                  Icons.next_plan,
                  color: white,
                ),
                label: const Text(
                  "Check-In",
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
      )),
    );
  }
}

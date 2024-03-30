import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nowapps/model/data/retailer_model.dart';
import 'package:nowapps/model/service/db_retailer_service.dart';
import 'package:nowapps/viewmodel/location_model.dart';

final nameController = TextEditingController();
final emailController = TextEditingController();
final locationController = TextEditingController();
final addressController = TextEditingController();
final phoneNumberController = TextEditingController();

Future<void> addretailer(BuildContext context) async {
  final LocationModel currentLocation = Get.find<LocationModel>();

  final name = nameController.text.trim();
  final email = emailController.text.trim();
  final landmark = locationController.text.trim();
  final address = addressController.text.trim();
  final phoneNumber = int.parse(phoneNumberController.text.trim());

  final model1 = RetailerModel(
      currentlocation: currentLocation.currentAddress,
      date: DateTime.now().toIso8601String(),
      name: name,
      email: email,
      landmark: landmark,
      address: address,
      phoneNumber: phoneNumber);
  RetailerController retailerController = Get.find<RetailerController>();
  retailerController.addRetailers(model1);
}

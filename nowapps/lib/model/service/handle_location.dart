import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

Future<bool> handleLocationPermission() async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    Get.snackbar("Location service disabled", "pls enable the service");
    return false;
  }
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      Get.snackbar("Location permissions are denied", "");
      return false;
    }
  }
  if (permission == LocationPermission.deniedForever) {
    Get.snackbar("Location permissions are permanently denied",
        "we cannot request permissions.");
    return false;
  }
  return true;
}

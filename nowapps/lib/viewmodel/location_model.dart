import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationModel extends GetxController {
  final Rx<LatLng?> _currentPosition = Rx<LatLng?>(null);
  final RxString _currentAddress = RxString('');

  LatLng? get currentPosition => _currentPosition.value;
  String get currentAddress => _currentAddress.value;

  @override
  void onInit() {
    super.onInit();
    getLocation();
  }

  Future<void> getLocation() async {
    bool permissionGranted = await _requestLocationPermission();
    if (permissionGranted) {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best,
      );
      double lat = position.latitude;
      double long = position.longitude;
      _currentPosition.value = LatLng(lat, long);
      updateCurrentAddress();
    } else {
      _currentAddress.value = '';
    }
  }

  Future<bool> _requestLocationPermission() async {
    LocationPermission permission = await Geolocator.requestPermission();
    return permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse;
  }

  Future<void> updateCurrentAddress() async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        _currentPosition.value!.latitude,
        _currentPosition.value!.longitude,
      );
      if (placemarks.isNotEmpty) {
        Placemark placemark = placemarks.first;
        _currentAddress.value =
            "${placemark.street}, ${placemark.locality}, ${placemark.administrativeArea}, ${placemark.country}";
      } else {
        _currentAddress.value = "Address not found";
      }
    } catch (e) {
      _currentAddress.value = "Error: $e";
    }
  }
}

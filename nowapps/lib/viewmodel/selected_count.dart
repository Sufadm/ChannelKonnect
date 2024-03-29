import 'package:get/get.dart';

class SelectedProductCount extends GetxController {
  RxInt count = 0.obs;

  void updateCount(int selectedProductsCount) {
    count.value = selectedProductsCount;
  }
}

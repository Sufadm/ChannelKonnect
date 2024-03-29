import 'package:get/get.dart';
import 'package:nowapps/model/data/product_model.dart';
import 'package:nowapps/model/service/product_service.dart';

class ProductController extends GetxController {
  final ProductService _productService = ProductService();
  final products = <Product>[].obs;
  final isLoading = true.obs;
  final selectedProducts = <Product>[].obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  Future<void> fetchProducts() async {
    try {
      isLoading(true);
      final productList = await _productService.fetchProducts();
      products.assignAll(productList);
    } finally {
      isLoading(false);
    }
  }

  void toggleProductSelection(Product product) {
    if (selectedProducts.contains(product)) {
      selectedProducts.remove(product);
    } else {
      selectedProducts.add(product);
    }
  }
}

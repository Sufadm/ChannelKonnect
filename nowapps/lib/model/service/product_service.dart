import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:nowapps/model/data/product_model.dart';

class ProductService {
  Future<List<Product>> fetchProducts() async {
    final response =
        await http.get(Uri.parse('https://www.jsonkeeper.com/b/GCQS'));

    if (response.statusCode == 200) {
      final List<dynamic> responseData =
          json.decode(response.body)['data']['products'];
      return responseData.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}

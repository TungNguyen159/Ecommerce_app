import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shop_app/data/models/product_model.dart';

class Apiservice {
  //get api url
  static const String baseUrl = 'https://fakestoreapi.com';
  static const String productsEndpoint = '/products';
  //get all products 
  Future<List<ProductModels>> getAllProducts() async {
    final response = await http.get(Uri.parse('$baseUrl$productsEndpoint'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((json) => ProductModels.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
  //get single product by id
  Future<ProductModels> getProductById(int id) async {
    final response = await http.get(Uri.parse('$baseUrl$productsEndpoint/$id'));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return ProductModels.fromJson(jsonData);
    } else {
      throw Exception('Failed to load product with id $id');
    }
  }
}
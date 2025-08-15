import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../model/product.dart';

class HomeCategoryController extends GetxController {
  var isLoading = true.obs;
  var products = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadProducts();
  }

  Future<void> loadProducts() async {
    isLoading(true);
    await Future.delayed(const Duration(seconds: 2)); // Simulate API delay

    List<String> jsonFiles = [
      'assets/json/panel_indicator_lights.json',
      'assets/json/diodes_and_rectifiers.json',
    ];

    List<Product> loadedProducts = [];

    for (String file in jsonFiles) {
      String data = await rootBundle.loadString(file);
      List<dynamic> jsonResult = json.decode(data);
      loadedProducts.addAll(jsonResult.map((item) => Product.fromJson(item)).toList());
    }

    products.assignAll(loadedProducts);
    isLoading(false);
  }
}
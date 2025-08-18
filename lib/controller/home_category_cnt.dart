import 'dart:convert';
import 'dart:math';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../model/product.dart';

class HomeCategoryController extends GetxController {
  var isLoading = true.obs;
  var products = <Product>[].obs;
  var exploreCategory = <ExploreCategory>[].obs;

  @override
  void onInit() {
    loadProducts();
    super.onInit();
  }

  Future<void> loadProducts() async {
    isLoading(true);
    await Future.delayed(const Duration(seconds: 2)); // Simulate API delay

    List<String> jsonFiles = [
      'assets/json/connectors.json',
      'assets/json/crystal_oscillators.json',
      'assets/json/diodes_and_rectifiers.json',
      'assets/json/fuses.json',
      'assets/json/panel_indicator_lights.json',
      'assets/json/potentiometer.json',
      'assets/json/relays.json',
      'assets/json/switches.json',
      'assets/json/thyristors.json',
    ];

    List<Product> loadedProducts = [];

    for (String file in jsonFiles) {
      String data = await rootBundle.loadString(file);
      final jsonResult = json.decode(data);
      loadedProducts.addAll((jsonResult['products'] as List).map((item) => Product.fromJson(item)).toList());

      loadedProducts.shuffle(Random());
      exploreCategory.add(ExploreCategory(categoryName: jsonResult['category'], categoryImg: jsonResult['categoryImg'], lstProduct: loadedProducts.take(4).toList()));
    }

    isLoading(false);
  }
}

class ExploreCategory{
  final String categoryName;
  final String categoryImg;
  final List<Product> lstProduct;

  ExploreCategory({
    required this.categoryName,
    required this.categoryImg,
    required this.lstProduct,
});
}
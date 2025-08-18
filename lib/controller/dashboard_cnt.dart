import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../model/product.dart';

class DashboardController extends GetxController {
  var isLoading = true.obs;
  var products = <Product>[].obs;
  var categoryImages = [
    'assets/images/dashboard/circuits.png',
    'assets/images/dashboard/resistors.png',
    'assets/images/dashboard/capacitors.png',
    'assets/images/dashboard/inductors.png',
    'assets/images/dashboard/transistor.png'].obs;
  var bestDeals = <Product>[].obs;
  var newArrivals = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadProducts();
  }

  Future<void> loadProducts() async {
    try {
      // Simulate 3 second delay
      await Future.delayed(Duration(seconds: 1));

      /*final String response = await rootBundle.loadString('assets/json/capacitors_category.json');
      final data = await json.decode(response);

      products.assignAll((data['products'] as List).map((e) => Product.fromJson(e)).toList());*/

      List<String> jsonFiles = [
        'assets/json/capacitors_category.json',
        'assets/json/circuits_category.json',
        'assets/json/inductors_category.json',
        'assets/json/resistor_options_category.json',
        'assets/json/transistors_category.json',
      ];

      List<Product> loadedProducts = [];

      for (String file in jsonFiles) {
        String data = await rootBundle.loadString(file);
        final jsonResult = json.decode(data);
        loadedProducts.addAll((jsonResult['products'] as List).map((item) => Product.fromJson(item, category: jsonResult['category'])).toList());
      }

      products.assignAll(loadedProducts);
      products.shuffle(Random());

      // Filter best deals (example logic)
      bestDeals.assignAll(products.where((p) => p.rating > 3.5).take(6).toList());

      // Filter new arrivals (example logic)
      newArrivals.assignAll(products);

      isLoading(false);
    } catch (e) {
      debugPrint('Error: ${e.toString()}');
      isLoading(false);
      Get.snackbar('Error', 'Failed to load products');
    }
  }
}
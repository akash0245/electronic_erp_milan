import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../model/product.dart';

class DashboardController extends GetxController {
  var isLoading = true.obs;
  var products = <Product>[].obs;
  var categories = ['Circuits', 'Resistors', 'Capacitors', 'Inductors', 'Transformers'].obs;
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
      await Future.delayed(Duration(seconds: 3));

      final String response = await rootBundle.loadString('assets/products.json');
      final data = await json.decode(response);

      products.assignAll((data['products'] as List).map((e) => Product.fromJson(e)).toList());

      // Filter best deals (example logic)
      bestDeals.assignAll(products.where((p) => p.rating > 3.5).take(6).toList());

      // Filter new arrivals (example logic)
      newArrivals.assignAll(products.where((p) => p.category == 'Diodes' || p.category == 'Thyristors').take(9).toList());

      isLoading(false);
    } catch (e) {
      isLoading(false);
      Get.snackbar('Error', 'Failed to load products');
    }
  }
}
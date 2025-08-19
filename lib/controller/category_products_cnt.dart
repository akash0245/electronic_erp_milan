import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../model/product.dart';

class CategoryProductsController extends GetxController {
  var isLoading = true.obs;
  var products = <Product>[].obs;
  late String category;

  @override
  void onInit() {
    category = Get.arguments[0] ?? "Capacitors";
    loadProducts();
    super.onInit();
  }

  Future<void> loadProducts() async {
    isLoading(true);
    await Future.delayed(const Duration(seconds: 1)); // Simulate API delay

    String fileName = category.toLowerCase().replaceAll(RegExp(r' '), "_");

    String jsonFile = 'assets/json/$fileName.json';
    debugPrint('jsonFile: $jsonFile');

    String data = await rootBundle.loadString(jsonFile);
    final jsonResult = json.decode(data);
    products.addAll((jsonResult['products'] as List).map((item) => Product.fromJson(item, category: jsonResult['category'])).toList());

    products.shuffle(Random());
    isLoading(false);
  }
}
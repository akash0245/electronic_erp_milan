import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../model/product.dart';

class HomeCategoryController extends GetxController {
  var isLoading = true.obs;
  var components = <Product>[].obs;
  var categories = ['Diodes', 'Thyristors', 'Potentiometer', 'Crystal Oscillators'].obs;

  @override
  void onInit() {
    super.onInit();
    loadComponents();
  }

  Future<void> loadComponents() async {
    try {
      // 3-second delay simulation
      await Future.delayed(Duration(seconds: 3));

      final String response = await rootBundle.loadString('assets/components.json');
      final data = await json.decode(response);

      components.assignAll(
        (data['components'] as List)
            .map((e) => Product.fromJson(e))
            .toList(),
      );

      isLoading(false);
    } catch (e) {
      isLoading(false);
      Get.snackbar('Error', 'Failed to load components');
    }
  }

  List<Product> getComponentsByCategory(String category) {
    return components.where((c) => c.category == category).toList();
  }
}
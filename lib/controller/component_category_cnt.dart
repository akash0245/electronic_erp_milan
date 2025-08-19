import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../model/product.dart';

class ComponentCategoryController extends GetxController {
  var isLoading = true.obs;
  var categoryImages = [
    'assets/images/categories/component_categories/circuits.png',
    'assets/images/categories/component_categories/resistor_options.png',
    'assets/images/categories/component_categories/capacitors.png',
    'assets/images/categories/component_categories/inductors.png',
    'assets/images/categories/component_categories/transistors.png'];
  var categoryName = [
    'Circuits','Resistor options','Capacitors', 'Inductors', 'Transistors'];

  @override
  void onInit() {
    loadProducts();
    super.onInit();
  }

  Future<void> loadProducts() async {
    isLoading(true);
    await Future.delayed(const Duration(seconds: 1)); // Simulate API delay

    isLoading(false);
  }
}
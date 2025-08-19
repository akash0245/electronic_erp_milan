import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/orders.dart';
import '../model/product.dart';
import '../screens/order_list.dart';

class OrderDetailController extends GetxController {
  final name = ''.obs;
  final address = ''.obs;
  final email = ''.obs;

  final nameError = RxString('');
  final addressError = RxString('');
  final emailError = RxString('');

  RxBool isProcessing = false.obs;


  late Product productDetail;
  late String category;
  late bool isDiscount;

  @override
  void onInit() {
     productDetail = Get.arguments[0] ?? {};
     category = Get.arguments[1] ?? "";
     isDiscount = Get.arguments[2] ?? false;
     super.onInit();
  }

  void validateName(String value) {
    name.value = value;
    if (value.isEmpty) {
      nameError.value = 'Name is required';
    } else if (value.length > 100) {
      nameError.value = 'Name must be less than 100 characters';
    } else {
      nameError.value = '';
    }
  }

  void validateAddress(String value) {
    address.value = value;
    if (value.isEmpty) {
      addressError.value = 'Address is required';
    } else {
      addressError.value = '';
    }
  }

  void validateEmail(String value) {
    email.value = value;
    if (value.isEmpty) {
      emailError.value = 'Email is required';
    } else if (!GetUtils.isEmail(value)) {
      emailError.value = 'Enter a valid email address';
    } else {
      emailError.value = '';
    }
  }

  bool validateForm() {
    validateName(name.value);
    validateAddress(address.value);
    validateEmail(email.value);

    return nameError.value.isEmpty &&
        addressError.value.isEmpty &&
        emailError.value.isEmpty;
  }

  void submitOrder() {
    isProcessing(true);
    if (validateForm()) {


      List<Orders> orderList = Orders.getUserList();

      Orders newOrder = Orders(
          category: category,
          name: name.value,
          address: address.value,
          email: email.value,
          isDiscount: isDiscount,
          orderProduct: productDetail);

      orderList.add(newOrder);

      Orders.setUserList(orderList);

      // Process order
      Get.snackbar(
          'Success', 'Order confirmed!',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white
      );

      isProcessing(false);

      Get.off(() => OrderList());

    }
    isProcessing(false);
  }
}
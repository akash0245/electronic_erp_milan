import 'package:get/get.dart';

import '../model/product.dart';

class ProductDetailController extends GetxController {
  var isLoading = true.obs;
  late Product productDetail;
  late String category;
  late bool isDiscount;

  @override
  void onInit() {
    super.onInit();

    // Simulate 3 seconds loading
    Future.delayed(Duration(seconds: 2), () {
      productDetail = Get.arguments[0] ?? {};
      category = Get.arguments[1] ?? "";
      isDiscount = Get.arguments[2] ?? false;
      isLoading.value = false;
    });
  }
}

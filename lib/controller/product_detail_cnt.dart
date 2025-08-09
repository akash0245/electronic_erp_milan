import 'package:get/get.dart';

import '../model/product.dart';

class ProductDetailController extends GetxController {
  var isLoading = true.obs;
  late Product productDetail;
  late String category;

  @override
  void onInit() {
    super.onInit();

    // Simulate 3 seconds loading
    Future.delayed(Duration(seconds: 2), () {
      productDetail = Get.arguments[0] ?? {};
      category = Get.arguments[1] ?? "";
      isLoading.value = false;
    });
  }
}

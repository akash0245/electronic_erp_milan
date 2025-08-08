import 'package:get/get.dart';

class ProductDetailController extends GetxController {
  var isLoading = true.obs;
  var product = {}.obs;

  @override
  void onInit() {
    super.onInit();

    // Simulate 3 seconds loading
    Future.delayed(Duration(seconds: 3), () {
      product.value = Get.arguments ?? {};
      isLoading.value = false;
    });
  }
}

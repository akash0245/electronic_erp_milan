import 'package:get/get.dart';

import '../model/product.dart';

class ProductDetailController extends GetxController {
  var isLoading = true.obs;
  late Product productDetail;
  late String category;
  late bool isDiscount;
  late bool isFromOrder;

  @override
  void onInit() {
    super.onInit();

    // Simulate 3 seconds loading
    Future.delayed(Duration(seconds: 1), () {
      productDetail = Get.arguments[0] ?? {};
      category = Get.arguments[1] ?? "";
      isDiscount = Get.arguments[2] ?? false;
      isFromOrder = Get.arguments[3] ?? false;
      isLoading.value = false;
    });
  }

  void setUpdatedData(Product updateProduct, String categoryName, bool discount, bool fromOrderPage){
    productDetail = updateProduct;
    category = categoryName;
    isDiscount = discount;
    isFromOrder = fromOrderPage;
  }

}

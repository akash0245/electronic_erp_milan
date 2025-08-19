
import 'package:get/get.dart';

import '../controller/category_products_cnt.dart';
import '../controller/component_category_cnt.dart';
import '../controller/dashboard_cnt.dart';
import '../controller/home_category_cnt.dart';
import '../controller/order_detail_cnt.dart';
import '../controller/order_list_cnt.dart';
import '../controller/product_detail_cnt.dart';

class BaseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashboardController(), fenix: true);
    Get.lazyPut(() => ComponentCategoryController(), fenix: true);
    Get.lazyPut(() => HomeCategoryController(), fenix: true);
    Get.lazyPut(() => CategoryProductsController(), fenix: true);
    Get.lazyPut(() => ProductDetailController(), fenix: true);
    Get.lazyPut(() => OrderDetailController(), fenix: true);
    Get.lazyPut(() => OrderListController(), fenix: true);
  }
}

import 'package:Electronic/utility/widget_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controller/dashboard_cnt.dart';
import 'product_detail.dart';

class DiscountProduct extends GetView<DashboardController> {

  final int pageType;

  const DiscountProduct(this.pageType, {super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(pageType == 1 ? 'Discount Product': pageType == 2 ?'Best Deals' : 'All Product'), centerTitle: true),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return GridView.builder(
          padding: EdgeInsets.all(3.w),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 3.h,
            crossAxisSpacing: 2.w,
            childAspectRatio: 0.8,
          ),
          itemCount: pageType == 1
              ? controller.discountProduct.length
              : pageType == 2 ? controller.bestDeals.length
              : controller.newArrivals.length,
          itemBuilder: (context, index) {
            final product =
            pageType == 1
                ? controller.discountProduct[index]
                : pageType == 2 ? controller.bestDeals[index]
                : controller.newArrivals[index];
            return CommonWidget.dashboardProduct(product, () {
              Get.to(
                    () => ProductDetailScreen(),
                arguments: [product, product.category, pageType == 1, false],
              );
            },  isDiscount: pageType == 1);
          },
        );
      }),
    );
  }
}

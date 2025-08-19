import 'package:Electronic/utility/widget_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controller/dashboard_cnt.dart';
import 'product_detail.dart';

class DiscountProduct extends GetView<DashboardController> {

  final bool isDiscount;

  const DiscountProduct(this.isDiscount, {super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(isDiscount ? 'Discount Product': 'Best Deals'), centerTitle: true),
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
          physics: NeverScrollableScrollPhysics(),
          itemCount: isDiscount ? controller.discountProduct.length: controller.bestDeals.length,
          itemBuilder: (context, index) {
            final product =
            isDiscount ? controller.discountProduct[index] : controller.bestDeals[index];
            return CommonWidget.dashboardProduct(product, () {
              Get.to(
                    () => ProductDetailScreen(),
                arguments: [product, product.category, isDiscount],
              );
            },  isDiscount: isDiscount);
          },
        );
      }),
    );
  }
}

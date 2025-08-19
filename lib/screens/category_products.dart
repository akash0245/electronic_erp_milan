import 'package:Electronic/utility/widget_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controller/category_products_cnt.dart';
import 'product_detail.dart';

class CategoryProduct extends GetView<CategoryProductsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(controller.category), centerTitle: true),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return GridView.builder(
          padding: EdgeInsets.all(3.w),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 2.h,
            crossAxisSpacing: 2.w,
            childAspectRatio: 0.75,
          ),
          physics: NeverScrollableScrollPhysics(),
          itemCount: controller.products.length,
          itemBuilder: (context, index) {
            final product =
            controller.products[index];
            return CommonWidget.categoryProduct(product, () {
              Get.to(
                    () => ProductDetailScreen(),
                arguments: [product, product.category, false],
              );
            });
          },
        );
      }),
    );
  }
}

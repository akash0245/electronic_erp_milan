import 'package:Electronic/utility/widget_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controller/home_category_cnt.dart';
import 'product_detail.dart';

class HomeCategory extends GetView<HomeCategoryController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Products"), centerTitle: true),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          itemCount: controller.exploreCategory.length,
          physics: AlwaysScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(1.5.w),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        controller.exploreCategory[index].categoryImg,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(width: 2.w),
                      Text(controller.exploreCategory[index].categoryName),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(1.0.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            gradient: LinearGradient(
                              colors: [Color(0xFFA1D56E), Color(0xFF62BD5A)],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                          ),
                          child: Text(
                            'See More',
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 1.w),
                  GridView.builder(
                    padding: EdgeInsets.all(3.w),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 2.h,
                      crossAxisSpacing: 2.w,
                      childAspectRatio: 0.75,
                    ),
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: controller.exploreCategory[0].lstProduct.length,
                    itemBuilder: (context, index) {
                      final product =
                          controller.exploreCategory[0].lstProduct[index];
                      return CommonWidget.categoryProduct(product, () {
                        Get.to(
                          () => ProductDetailScreen(),
                          arguments: [product, product.category, false],
                        );
                      });
                    },
                  ),
                ],
              ),
            );
          },
        );
      }),
    );
  }
}

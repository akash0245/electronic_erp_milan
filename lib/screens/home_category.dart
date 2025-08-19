import 'package:Electronic/utility/widget_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controller/home_category_cnt.dart';
import 'category_products.dart';
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
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(1.5.w),
              ),
              margin: EdgeInsets.all(2.h),
              padding: EdgeInsets.only(top: 1.w),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(1.5.w),
                    child: Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Image.asset(
                                controller.exploreCategory[index].categoryImg,
                                height: 3.h,
                                width: 3.w,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(width: 2.w),
                              Text(controller.exploreCategory[index].categoryName),
                            ],
                          ),
                        ),

                        InkWell(
                          onTap: (){
                            Get.to(()=> CategoryProduct(), arguments: [controller.exploreCategory[index].categoryName]);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 2.0.w, vertical: 1.0.w),
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
                  ),
                  SizedBox(height: 1.w),
                  SizedBox(
                    height: 54.h,
                    child: Padding(
                      padding: EdgeInsets.only(left: 2.0.w, right: 1.5.w),
                      child: GridView.builder(
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 2.h,
                          crossAxisSpacing: 2.w,
                          childAspectRatio: 0.8,
                        ),
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: controller.exploreCategory[index].lstProduct.length,
                        itemBuilder: (context, indexProduct) {
                          final product =
                              controller.exploreCategory[index].lstProduct[indexProduct];
                          return CommonWidget.categoryProduct(product, () {
                            Get.to(
                              () => ProductDetailScreen(),
                              arguments: [product, product.category, false],
                            );
                          });
                        },
                      ),
                    ),
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

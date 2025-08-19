import 'package:Electronic/screens/category_products.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controller/component_category_cnt.dart';

class ComponentCategory extends GetView<ComponentCategoryController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Category'), centerTitle: true),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return GridView.builder(
          padding: EdgeInsets.all(3.w),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 2.h,
            crossAxisSpacing: 4.w,
            childAspectRatio: 1,
          ),
          itemCount: controller.categoryImages.length,
          itemBuilder: (context, index) {

            return InkWell(
              onTap: (){
                Get.to(()=> CategoryProduct(), arguments: [controller.categoryName[index]]);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Center(
                        child: Image.asset(
                          controller.categoryImages[index],
                          width: 28.w,
                          height: 28.w,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    SizedBox(height: 0.2.w),
                    Padding(
                      padding: EdgeInsets.only(bottom: 1.w),
                      child: Text(
                        controller.categoryName[index],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16.sp,
                          fontWeight: FontWeight.w500
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}

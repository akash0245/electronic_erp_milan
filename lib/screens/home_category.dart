import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controller/home_category_cnt.dart';

class HomeCategory extends GetView<HomeCategoryController> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
        centerTitle: true,
      ),
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
          itemCount: controller.products.length,
          itemBuilder: (context, index) {
            final product = controller.products[index];
            return Card(
              elevation: 3,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.w)),
              child: Padding(
                padding: EdgeInsets.all(2.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Image.asset(product.imagePath, fit: BoxFit.contain),
                    ),
                    SizedBox(height: 1.h),
                    Text(product.name,
                        style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.bold)),
                    Text("₹ ${product.price.toStringAsFixed(2)}",
                        style: TextStyle(fontSize: 10.sp, color: Colors.red)),
                    Row(
                      children: [
                        Icon(Icons.star, size: 10.sp, color: Colors.amber),
                        SizedBox(width: 1.w),
                        Text(product.rating.toString(), style: TextStyle(fontSize: 9.sp)),
                      ],
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
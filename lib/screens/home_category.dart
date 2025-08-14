import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controller/home_category_cnt.dart';

class HomeCategory extends GetView<HomeCategoryController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Electronic Components'),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 2.h),
                Text('Loading Components...'),
              ],
            ),
          );
        } else {
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 2.h),
            child: Column(
                children: [
                _buildCategorySection('Diodes And Rectifiers'),
                _buildCategorySection('Thyristors'),
                _buildCategorySection('Potentiometer'),
                _buildCategorySection('Crystal Oscillators'),
                SizedBox(height: 2.h),
                TextButton(
                  onPressed: () {},
                  child: Text('See More', style: TextStyle(fontSize: 12.sp))),
                SizedBox(height: 2.h),
              ],
            ),
          );
        }
      }),
    );
  }

  Widget _buildCategorySection(String category) {
    final items = controller.getComponentsByCategory(category);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
          child: Text(
            category,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          itemCount: items.length,
          separatorBuilder: (_, __) => Divider(height: 1.h),
          itemBuilder: (ctx, index) {
            final item = items[index];
            return ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(item.name),
              trailing: Text(
                '¥ ${item.price.toStringAsFixed(2)} (${item.rating.toStringAsFixed(1)})',
                style: TextStyle(fontSize: 12.sp),
              ),
            );
          },
        ),
        Divider(thickness: 1, height: 3.h),
      ],
    );
  }
}
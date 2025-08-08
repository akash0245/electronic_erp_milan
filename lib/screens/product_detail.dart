import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controller/product_detail_cnt.dart';

class ProductDetailScreen extends StatelessWidget {

  final ProductDetailController controller = Get.put(ProductDetailController());

  @override
  Widget build(BuildContext context) {

    return Obx(() {
      if (controller.isLoading.value) {
        return Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      }

      final product = controller.product;

      return Scaffold(
        appBar: AppBar(
          title: Text(product['name'] ?? 'Product Detail'),
          leading: BackButton(),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(4.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                product['image'] ?? '',
                width: 100.w,
                height: 30.h,
                fit: BoxFit.contain,
              ),
              SizedBox(height: 2.h),

              Text(
                product['name'] ?? '',
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 1.h),

              Row(
                children: [
                  Icon(Icons.star, color: Colors.orange, size: 10.w),
                  SizedBox(width: 2.w),
                  Text(product['rating'].toString()),
                ],
              ),
              SizedBox(height: 2.h),
              Text(
                'Product Detail:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 1.h),

              ...List.generate(product['productDetail'].length, (index) {
                return Text("${index + 1}. ${product['productDetail'][index]}");
              }),

              SizedBox(height: 2.h),

              Text(
                'Category: ${product['category']}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 2.h),

              Text(
                'Description:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 1.h),
              Text(product['description'] ?? ''),

              SizedBox(height: 2.h),

              Text(
                'Specifications',
                style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 1.h),

              ..._buildSpecs(product['specs']),

              Spacer(),

              Row(
                children: [
                  Text(
                    "₹ ${product['price'] ?? '0.00'}",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                  Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      // Your buy logic
                    },
                    child: Text('BUY NOW', style: TextStyle(fontSize: 12.sp)),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
    }
  }

List<Widget> _buildSpecs(Map<String, dynamic>? specs) {
  if (specs == null) return [];

  return specs.entries.map((entry) {
    final label = formatKey(entry.key);
    final value = entry.value.toString();
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0.5.h),
      child: Row(
        children: [
          Text("$label: ", style: TextStyle(fontWeight: FontWeight.w600)),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }).toList();
}

String formatKey(String key) {
  final words = key
      .replaceAllMapped(RegExp(r'([a-z])([A-Z])'), (m) => '${m[1]} ${m[2]}')
      .split(' ')
      .map((w) => w[0].toUpperCase() + w.substring(1))
      .join(' ');
  return words;
}

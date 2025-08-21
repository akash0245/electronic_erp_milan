import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controller/product_detail_cnt.dart';
import '../model/product.dart';
import 'order_detail.dart';

class ProductDetailScreen extends StatelessWidget {

  final ProductDetailController controller = Get.find();
  String arrowImgPath = 'assets/images/dashboard/arrow.png';

  @override
  Widget build(BuildContext context) {

    return Obx(() {
      if (controller.isLoading.value) {
        return Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      }

      final Product product = controller.productDetail;

      return Scaffold(
        appBar: AppBar(
          title: Text(product.name),
          leading: BackButton(),
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(4.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      product.imagePath ?? '',
                      width: 100.w,
                      height: 30.h,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(height: 2.h),

                    Text(
                      product.name ?? '',
                      style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                    ),

                    SizedBox(height: 1.h),

                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.orange, size: 5.w),
                        SizedBox(width: 2.w),
                        Text(product.rating.toString()),
                      ],
                    ),
                    SizedBox(height: 2.h),
                    Row(
                      children: [
                        Image.asset(arrowImgPath, width: 5.w,),
                        SizedBox(width: 1.w,),
                        Text(
                          'Product Detail:',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(height: 1.h),

                    ...List.generate(product.productDetail.length, (index) {
                      return Padding(
                        padding: EdgeInsets.only(left: 5.w),
                        child: Text("${index + 1}. ${product.productDetail[index]}"),
                      );
                    }),

                    SizedBox(height: 2.h),

                    Row(
                      children: [
                        Image.asset(arrowImgPath, width: 5.w,),
                        SizedBox(width: 1.w,),
                        Text(
                          'Category: ${controller.category}',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(height: 2.h),

                    Row(
                      children: [
                        Image.asset(arrowImgPath, width: 5.w,),
                        SizedBox(width: 1.w,),
                        Text(
                          'Description:',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(height: 1.h),
                    Padding(
                      padding: EdgeInsets.only(left: 5.w),
                      child: Text(product.description ?? ''),
                    ),

                    SizedBox(height: 2.h),

                    Row(
                      children: [
                        Image.asset(arrowImgPath, width: 5.w,),
                        SizedBox(width: 1.w,),
                        Text(
                          'Specifications',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(height: 1.h),

                    buildSpecs(product.lstSpecification),

                    SizedBox(height: 1.h),

                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 4.w, vertical: 3.h),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(5.w)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    controller.isDiscount && product.discountPrice != null
                        ? "₹ ${product.discountPrice}"
                        : "₹ ${product.price}",
                    style: TextStyle(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                  controller.isFromOrder
                      ? SizedBox(height: 8.h,)
                      : InkWell(
                      onTap: (){
                        Get.to(() => OrderDetail(), arguments: [product, controller.category, controller.isDiscount]);
                      },
                      child: Image.asset('assets/images/dashboard/buy_btn.png',
                        width: 35.w,
                        height: 8.h,
                      )
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
    }
  }

Widget buildSpecs(List<MapEntry<String, dynamic>> specs) {
  if (specs.isEmpty) return SizedBox();

  return Padding(
      padding: EdgeInsets.symmetric(vertical: 0.5.h),
      child: ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: specs.length,
        separatorBuilder: (context, index){
          return Padding(
              padding: EdgeInsetsGeometry.symmetric(vertical: 2.w),
            child: Container(
              color: Colors.grey[500],
              height: 0.1.w,
            ),
          );
        },
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(left: 5.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${formatKey(specs[index].key.toString())}: ", style: TextStyle(fontWeight: FontWeight.w600)),
                Expanded(child: Text(specs[index].value.toString())),
              ],
            ),
          );
        }
      ),
    );
}

String formatKey(String key) {
  final words = key
      .replaceAllMapped(RegExp(r'([a-z])([A-Z])'), (m) => '${m[1]} ${m[2]}')
      .split(' ')
      .map((w) => w[0].toUpperCase() + w.substring(1))
      .join(' ');
  return words;
}

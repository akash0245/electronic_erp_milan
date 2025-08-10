import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controller/order_list_cnt.dart';
import '../model/orders.dart';
import 'product_detail.dart';

class OrderList extends StatelessWidget {
  OrderList({super.key});

  final OrderListController controller = Get.find();

  @override
  Widget build(BuildContext context) {

      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Orders"),
          leading: BackButton(),
        ),
        body: Obx(() => controller.isLoading.value
            ?Center(child: CircularProgressIndicator())
            :controller.orderList.isEmpty
            ? Center(
              child: Text('No Order Found',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                  fontSize: 30
                ),
              ),
            )
            :ListView.separated(
            padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
            itemCount: controller.orderList.length,
            separatorBuilder: (context, index) => SizedBox(height: 2.h),
            itemBuilder: (context, index) {

              final order = controller.orderList[index];
              return _buildOrderItem(order, index);
        }),
      ));
  }

  Widget _buildOrderItem(Orders order, int index) {
    return InkWell(
      onTap: (){
        Get.to(() => ProductDetailScreen(), arguments: [order.orderProduct, controller.orderList[index].category]);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 6,
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Product Image
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
                child: Image.asset(
                  order.orderProduct!.imagePath,
                  width: 25.w,
                  height: 25.w,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            SizedBox(width: 4.w),

            // Product Details
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 2.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Product Title
                    Text(
                      order.orderProduct!.name,
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 0.3.h),

                    // Price
                    Text(
                      '₹ ${order.orderProduct!.price.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    SizedBox(height: 0.3.h),

                    // Quantity Controls
                    Row(
                      children: [
                        Text('Qty: ', style: TextStyle(fontSize: 14.sp)),
                        // IconButton(
                        //   icon: Icon(Icons.remove, size: 12.sp),
                        //   padding: EdgeInsets.zero,
                        //   constraints: BoxConstraints(),
                        //   onPressed: () => controller.decreaseQuantity(index),
                        // ),
                        Container(
                          width: 8.w,
                          alignment: Alignment.center,
                          child: Text(
                            '1',
                            style: TextStyle(fontSize: 14.sp),
                          ),
                        ),
                        // IconButton(
                        //   icon: Icon(Icons.add, size: 12.sp),
                        //   padding: EdgeInsets.zero,
                        //   constraints: BoxConstraints(),
                        //   onPressed: () => controller.increaseQuantity(index),
                        // ),
                      ],
                    ),

                    SizedBox(height: 0.3.h),

                    // Delivery Estimate
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 0.5.h),
                      decoration: BoxDecoration(
                        color: Colors.orange[50],
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        'Expected delivery in 5-7 days',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.orange[800],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
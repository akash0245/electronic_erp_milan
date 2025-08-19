import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../model/product.dart';

class CommonWidget {
  static Widget dashboardProduct(Product product, Function() onClickCallBack, {bool isDiscount = false}) {
    return InkWell(
      onTap: onClickCallBack,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Image.asset(
                  product.imagePath,
                  width: 80,
                  height: 80,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          SizedBox(height: 0.5.h),
          Text(
            product.name,
            style: TextStyle(fontSize: 13.sp),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              isDiscount && product.discountPrice != null
                  ? Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('₹ ${product.discountPrice!.toStringAsFixed(2)}',
                                      style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold),
                                    ),
                      SizedBox(width: 1.w),
                      Text('₹ ${product.price.toStringAsFixed(2)}',
                        style: TextStyle(
                            fontSize: 11.sp,
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough
                        ),
                      ),
                    ],
                  )
                  : Text(
                '₹ ${product.price.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 1.w),
              Row(
                children: [
                  Text(
                    '(${product.rating.toStringAsFixed(1)}',
                    style: TextStyle(fontSize: 12.sp),
                  ),
                  Icon(Icons.star, color: Colors.amber, size: 3.w),
                  Text(')', style: TextStyle(fontSize: 12.sp)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  static Widget categoryProduct(Product product, Function() onClickCallBack) {
    return InkWell(
      onTap: onClickCallBack,
      child: Card(
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
              Container(
                padding: EdgeInsets.fromLTRB(2.w, 1.w, 1.w, 1.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product.name,
                      style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.bold),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      children: [
                        Text("₹ ${product.price.toStringAsFixed(2)}",
                            style: TextStyle(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.red)),
                        SizedBox(width: 0.8.w),
                        Row(
                          children: [
                            Text(
                              '(${product.rating.toStringAsFixed(1)}',
                              style: TextStyle(
                                fontSize: 12.sp,
                              ),
                            ),
                            Icon(Icons.star, color: Colors.amber, size: 2.7.w,),
                            Text(')', style: TextStyle(fontSize: 12.sp),),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}

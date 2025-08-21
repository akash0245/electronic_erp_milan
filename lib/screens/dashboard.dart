import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../controller/dashboard_cnt.dart';
import '../model/product.dart';
import '../utility/widget_helper.dart';
import 'category_products.dart';
import 'component_category.dart';
import 'discount_products.dart';
import 'home_category.dart';
import 'order_list.dart';
import 'product_detail.dart';

class Dashboard extends GetView<DashboardController> {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Electronic Components'),
        titleTextStyle: TextStyle(
          fontSize: 18.sp,
          color: Colors.black,
          fontWeight: FontWeight.w800
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 5.w),
            child: InkWell(
              borderRadius: BorderRadius.all(Radius.circular(5.w)),
              onTap: (){
                Get.to(() => OrderList());
              },
              child: Image.asset(
                'assets/images/dashboard/img_bag.png',
                height: 8.w,
              ),
            ),
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return _buildLoadingScreen();
        } else {
          return _buildMainContent();
        }
      }),
    );
  }

  Widget _buildLoadingScreen() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 2.h),
          Text('Loading Electronic Components...', style: TextStyle(fontSize: 12.sp)),
        ],
      ),
    );
  }

  Widget _buildMainContent() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // Discount Banner
          InkWell(
            onTap: (){
              Get.to(() => DiscountProduct(3));
            },
            splashColor: Colors.transparent,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 5.w),
              child: Image.asset(
                'assets/images/dashboard/electronic_components.png',
                height: 30.w,
              ),
            ),
          ),

          SizedBox(height: 2.h),

          _buildSectionHeader('Components Categories',
                  () {
                    Get.to(() => ComponentCategory());
              }),

          SizedBox(height: 1.h),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: controller.categoryImages.map((imagePath) {
                return InkWell(
                  onTap: (){
                    String selectedImg = imagePath.split('/').last.split('.').first;
                    String categoryName = selectedImg[0].toUpperCase() + selectedImg.substring(1);
                    Get.to(() => CategoryProduct(),
                        arguments: [categoryName]);
                  },
                  child: SizedBox(
                    width: 15.w,
                    child: Image.asset(
                      imagePath,
                      fit: BoxFit.contain,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),

          SizedBox(height: 2.h),

          // Best Deals
          _buildSectionHeader('Best Deals, Top Products',
              () {
            Get.to(() => DiscountProduct(2));
              }),

          SizedBox(height: 1.h),

          _buildProductGrid(controller.bestDeals.take(6).toList().obs),

          SizedBox(height: 2.h),

          // Discount Banner
          InkWell(
            onTap: (){
              Get.to(() => DiscountProduct(1));
            },
            splashColor: Colors.transparent,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 5.w),
              child: Image.asset(
                'assets/images/dashboard/get_discount_on_first_product.png',
                height: 30.w,
              ),
            ),
          ),

          SizedBox(height: 2.h),

          // New Arrivals
          _buildSectionHeader('Explore New Arrivals',
            () {
              Get.to(() => HomeCategory());
            }),

          SizedBox(height: 1.h),
          _buildProductGrid(controller.newArrivals.where((p) => p.rating <= 3.5).take(9).toList().obs),
          SizedBox(height: 2.h),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title, Function() btnCallBack) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          InkWell(
            onTap: btnCallBack,
            borderRadius: BorderRadius.all(Radius.circular(4.w)),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.all(Radius.circular(4.w)),
              ),
              padding: EdgeInsets.all(1.2.w),
              child: Text(
                'See More',
                style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductGrid(RxList<Product> products) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 3.w,
        mainAxisSpacing: 2.h,
        childAspectRatio: 0.8,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return CommonWidget.dashboardProduct(product,
            (){
              Get.to(() => ProductDetailScreen(), arguments: [product, product.category, false, false]);
            }
        );
      },
    );
  }
}
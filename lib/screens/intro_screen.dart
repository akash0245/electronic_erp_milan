import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controller/order_detail_cnt.dart';
import 'dashboard.dart';

class IntroScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(12.w),
                    bottomRight: Radius.circular(12.w)
                )
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 8.h),
                  Image.asset(
                    'assets/images/dashboard/intro_screen.png', // Replace with your logo path
                    width: 70.w,
                    height: 35.h,
                    fit: BoxFit.contain,
                  ),
                  Text(
                    'ELECTRONIC COMPONENTS',
                    style: TextStyle(
                        fontSize: 19.sp,
                        fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 0.1.w), // Space between text and line
                  Container(
                    height: 0.35.w,
                    width: 80.w, // Match text width or use flexible width
                    color: Colors.black,
                  ),
                  SizedBox(height: 2.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6.w),
                    child: Text(
                      'Explore detailed specifications of electronic components with images, pinouts, pricing, and easy search options.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 15.sp,
                          color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 26.h),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: (){
                  Get.offAll(() => Dashboard());
                },
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: LinearGradient(
                          colors: [Color(0xFFA1D56E), Color(0xFF62BD5A)],
                          begin: Alignment.centerLeft,
                        end: Alignment.centerRight
                      )
                    ),
                    child: Center(
                      child: Text(
                        'Let\'s Start',
                        style: TextStyle(
                            fontSize: 17.sp,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 1.h),

              Text(
    'By Continuing you agree to our ',
    style: TextStyle(
    fontSize: 15.sp,
    color: Colors.black,
    ),
    ),

              GestureDetector(
                onTap: _launchPrivacyPolicy,
                child: Text(
                  'Privacy Policy',
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: Colors.green,
                    decoration: TextDecoration.underline
                  ),
                ),
              ),

              SizedBox(height: 1.5.h),


            ],
          ),
        ],
      ),
    );
  }

  Future<void> _launchPrivacyPolicy() async {
    final Uri url = Uri.parse('http://jtmachine.in/privacy-policy-2/');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
import 'package:Electronic/screens/intro_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Navigate after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAll(() => IntroScreen());
    });

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: 10.h),
            // Logo at the top (replace with your actual logo)
            Image.asset(
              'assets/splash_logo.png', // Replace with your logo path
              width: 60.w,
              height: 30.h,
              fit: BoxFit.contain,
            ),
            // Loader at the bottom
            Padding(
              padding: EdgeInsets.only(bottom: 10.h),
              child: const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
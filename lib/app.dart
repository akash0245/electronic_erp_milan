import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'screens/splash_screen.dart';
import 'utility/base_binding.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
      return Sizer(
        builder: (context, orientation, deviceType) => GetMaterialApp(
          title: "Electronic Items",
          debugShowCheckedModeBanner: false,
          initialBinding: BaseBinding(),
          home: SplashScreen(),
        ),
      );
  }
}
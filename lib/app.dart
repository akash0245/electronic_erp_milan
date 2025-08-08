import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'screens/splash_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
      return Sizer(
        builder: (p0, p1, p2) => GetMaterialApp(
          title: "Electronic Items",
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
        ),
      );
  }
}

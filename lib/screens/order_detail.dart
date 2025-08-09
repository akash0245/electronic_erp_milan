import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/order_detail_cnt.dart';

class OrderDetail extends StatelessWidget {
  final OrderDetailController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fill The Details'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Your Name :',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Obx(() => TextFormField(
              onChanged: controller.validateName,
              decoration: InputDecoration(
                hintText: 'Enter your name',
                errorText: controller.nameError.value.isEmpty
                    ? null
                    : controller.nameError.value,
                border: OutlineInputBorder(),
              ),
              maxLength: 100,
            )),
            SizedBox(height: 16),

            Text(
              'Address :',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Obx(() => TextFormField(
              onChanged: controller.validateAddress,
              decoration: InputDecoration(
                hintText: 'Enter your address',
                errorText: controller.addressError.value.isEmpty
                    ? null
                    : controller.addressError.value,
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            )),
            SizedBox(height: 16),

            Text(
              'Email :',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Obx(() => TextFormField(
              onChanged: controller.validateEmail,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: 'Enter your email',
                errorText: controller.emailError.value.isEmpty
                    ? null
                    : controller.emailError.value,
                border: OutlineInputBorder(),
              ),
            )),
            SizedBox(height: 24),

            ElevatedButton(
              onPressed: controller.submitOrder,
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: Text(
                  'CONFIRM ORDER',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
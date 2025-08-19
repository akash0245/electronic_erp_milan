import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/order_detail_cnt.dart';

class OrderDetail extends StatelessWidget {
  final OrderDetailController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text('Fill The Details'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height -
                      MediaQuery.of(context).padding.top -
                      kToolbarHeight - 32,
                ),
                child: IntrinsicHeight(
                  child: Column(
                    children: [
                      Expanded(
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
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: controller.submitOrder,
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
                                'CONFIRM ORDER',
                                style: TextStyle(
                                    fontSize: 16,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Obx(() => controller.isProcessing.value
                ? Container(
              color: Colors.black.withAlpha(100),
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            )
                : const SizedBox(),
            ),
          ],
        ),

      ),
    );
  }
}
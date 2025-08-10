import 'package:get/get.dart';

import '../model/orders.dart';

class OrderListController extends GetxController{

  List<Orders> orderList = [];
  RxBool isLoading = true.obs;
  @override
  void onInit() {

    loadProduct();
    super.onInit();
  }

  Future<void> loadProduct() async{
    await Future.delayed(Duration(seconds: 2));

    orderList = Orders.getUserList();
    isLoading(false);
  }

}
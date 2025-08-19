import 'dart:convert';

import 'package:get_storage/get_storage.dart';

import 'product.dart';

class Orders{
  String? category;
  String? name;
  String? address;
  String? email;
  bool? isDiscount;
  Product? orderProduct;

  Orders({
    required this.category,
    required this.name,
    required this.address,
    required this.email,
    required this.isDiscount,
    required this.orderProduct,
  });

  Orders.fromJson(Map<String, dynamic> json) {
    category = json['category'] ?? '';
    name = json['name'];
    address = json['address'];
    email = json['email'];
    isDiscount = json['isDiscount'];
    orderProduct = Product.fromJson(json['orderProduct']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['category'] = category;
    data['name'] = name;
    data['address'] = address;
    data['email'] = email;
    data['isDiscount'] = isDiscount;
    data['orderProduct'] = orderProduct!.toJson();
    return data;
  }


  static GetStorage getStorage = GetStorage();

  static Future<void> setUserList(List<Orders> userList) async {
    List<String> userJsonList =
    userList.map((user) => jsonEncode(user.toJson())).toList();
    await getStorage.write('orders', userJsonList);
  }

  static List<Orders> getUserList() {
    List<dynamic>? userJsonList =
    getStorage.read<List<dynamic>>('orders');
    if (userJsonList != null) {
      return userJsonList
          .map((userJson) => Orders.fromJson(jsonDecode(userJson)))
          .toList();
    }
    return [];
  }

}
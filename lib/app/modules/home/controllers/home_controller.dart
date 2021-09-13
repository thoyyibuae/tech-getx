import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_cli_tech_gebra/app/modules/home/models/product_model.dart';
// import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  bool isDark = true;
  var products = <Product>[].obs;

  var cartItems = <Product>[].obs;

  //get total Amount
  double get totalPrice =>
      cartItems.fold(0, (sum, item) => sum + item.price!.toDouble());

//add to cart
  addToCart(Product product) {
    cartItems.add(product);
  }

  final List locale = [
    {'name': 'ENGLISH', 'locale': Locale('en', 'US')},
    {'name': 'عرب', 'locale': Locale('ar', 'IN')},
    {'name': 'हिंदी', 'locale': Locale('hindi', 'IN')},
  ];

  final count = 0.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    Product product1 = Product(id: 1, name: "tvt", price: 3000);
    Product product2 = Product(id: 2, name: "car", price: 50000);
    products.add(product1);
    products.add(product2);

    // fetchProducts();

    super.onInit();
  }

  fetchProducts() async {
    await Future.delayed(Duration(seconds: 1));
    var serverRes = [];
  }

//change theme
  void changeTheme(state) {
    if (state == true) {
      Get.changeTheme(ThemeData.light());
      isDark = true;
    } else {
      Get.changeTheme(ThemeData.dark());
      isDark = false;
    }
    update();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_cli_tech/app/components/button.dart';
import 'package:get_cli_tech/app/components/cartbutton.dart';
import 'package:get_cli_tech/app/modules/getstorage/views/getstorage_view.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Cart To Add'.tr),
        actions: [
          GetBuilder<HomeController>(
            builder: (_) => Switch(
                value: controller.isDark,
                onChanged: (state) {
                  print("Printing ${state}");
                  controller.changeTheme(state);
                }),
          ),
        ],
      ),
      body: Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'hello'.tr,
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'message'.tr,
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'sub'.tr,
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          GetBuilder<HomeController>(builder: (_) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      _.buildLanguageDialog(context);
                    },
                    child: Text('changelang'.tr))
              ],
            );
          }),
          Expanded(
            child: GetX<HomeController>(builder: (controller) {
              return ListView.builder(
                  itemCount: controller.products.length,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: EdgeInsets.all(12.0),
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        "${'ProductName'.tr} :${controller.products[index].name}"),
                                    Text(
                                        "${'Price'.tr} :${controller.products[index].price}"),
                                  ],
                                )
                              ],
                            ),
                            CartButton(
                                text: "Add To Cart",
                                onTap: () => controller
                                    .addToCart(controller.products[index]))
                          ],
                        ),
                      ),
                    );
                  });
            }),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GetX<HomeController>(builder: (controller) {
                return Text("Total Amount : ${controller.totalPrice}");
              })
            ],
          ),
          lineButton(
              text: "Get Storage Example ",
              onTap: () {
                Get.to(() => GetstorageView());
              }),
          lineButton(
              text: "Bottom Sheet",
              onTap: () {
                Get.bottomSheet(Container(
                  height: 100,
                  color: Colors.white,
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(
                        Icons.home,
                        color: controller.isDark ? Colors.red : Colors.black,
                      ),
                      Icon(
                        Icons.shopping_bag,
                        color: controller.isDark ? Colors.red : Colors.black,
                      )
                    ],
                  ),
                ));
              }),
        ],
      ),
    ));
  }
}

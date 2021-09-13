import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_cli_tech/app/modules/getstorage/views/getstorage_view.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
//update lanaguage
  buildLanguageDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (builder) {
          return AlertDialog(
            title: Text('Choose Your Language'),
            content: Container(
              width: double.maxFinite,
              child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        child: Text(controller.locale[index]['name']),
                        onTap: () {
                          print(controller.locale[index]['name']);
                          var locale = controller.locale[index]['locale'];
                          if (controller.locale[index]['name'] == "ENGLISH") {
                            Get.updateLocale(locale);
                          }
                          if (controller.locale[index]['name'] == "عرب") {
                            Get.updateLocale(locale);
                          }
                          if (controller.locale[index]['name'] == "हिंदी") {
                            Get.updateLocale(locale);
                          }
                          Get.back();
                        },
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: Colors.blue,
                    );
                  },
                  itemCount: controller.locale.length),
            ),
          );
        });
  }

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
              ElevatedButton(
                  onPressed: () {
                    buildLanguageDialog(context);
                  },
                  child: Text('changelang'.tr)),
            ],
          ),
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
                            RaisedButton(
                                child: Text("Add to cart"),
                                color: Colors.blue,
                                textColor: Colors.white,
                                onPressed: () {
                                  controller
                                      .addToCart(controller.products[index]);
                                }),
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
          RaisedButton(
              child: Text(
                "Get Storage Example",
                style: TextStyle(color: Colors.red),
              ),
              onPressed: () {
                Get.to(() => GetstorageView());
              }),
          RaisedButton(
              child: Text(
                "Bottom Sheet",
                style: TextStyle(color: Colors.red),
              ),
              onPressed: () {
                Get.bottomSheet(Container(
                  height: 100,
                  color: Colors.white,
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(
                        Icons.home,
                      ),
                      Icon(Icons.shopping_bag)
                    ],
                  ),
                ));
              })
        ],
      ),
    ));
  }
}

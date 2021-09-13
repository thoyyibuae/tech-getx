import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/getstorage_controller.dart';

class GetstorageView extends GetView<GetstorageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('GetStorageView'),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetBuilder<GetstorageController>(
                init: GetstorageController(),
                builder: (_) {
                  return Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: TextField(
                          controller: _.email,
                          decoration: InputDecoration(hintText: "Email"),
                        ),
                      ),
                      RaisedButton(
                          child: Text(
                            "Validate",
                            style: TextStyle(color: Colors.red),
                          ),
                          onPressed: () {
                            if (GetUtils.isEmail(_.email.text)) {
                              print("validated success");
                              _.storage.write("email", _.email.text);
                              Get.defaultDialog(
                                  content: Text("Email Validated succesfully"));
                              // Get.back();
                            } else {
                              Get.snackbar("", "",
                                  snackPosition: SnackPosition.TOP,
                                  backgroundColor: Colors.red,
                                  colorText: Colors.white,
                                  titleText: Center(
                                      child: Text(
                                    "Invalid Email",
                                    style: TextStyle(color: Colors.white),
                                  )));
                            }
                          }),
                      FlatButton(
                          onPressed: () {
                            // controller.storage.write("email", _.email.text);
                            Get.to(StorageViewPageView(),
                                arguments: "${_.email.text}");
                          },
                          child: Text("View"))
                    ],
                  );
                })
          ],
        ));
  }
}

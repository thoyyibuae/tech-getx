import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_cli_tech/app/components/button.dart';
import 'package:get_cli_tech/app/components/validate_button.dart';
import 'package:get_cli_tech/app/modules/get_storage/views/storage_view.dart';
import 'package:get_cli_tech/app/modules/getstorage/controllers/getstorage_controller.dart';

class GetStorageView extends GetView<GetStorageController> {
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
            GetBuilder<GetStorageController>(
                init: GetStorageController(),
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
                      ValidateButton(
                          text: "Validate",
                          onTap: () {
                            if (GetUtils.isEmail(_.email.text)) {
                              print("validated success");
                              _.storage.write("email", _.email.text);
                              Get.defaultDialog(
                                  content: Text("Email Validated succesfully"));
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
                      lineButton(
                          text: "view",
                          onTap: () {
                            Get.to(StorageView(), arguments: "${_.email.text}");
                          })
                    ],
                  );
                })
          ],
        ));
  }
}

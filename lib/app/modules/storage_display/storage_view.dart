import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_cli_tech/app/modules/get_storage/controllers/getstorage_controller.dart';

class StorageView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Storage Page /Arguments View'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Storage by Arguments :${Get.arguments.toString()}',
              style: TextStyle(fontSize: 20),
            ),
            GetBuilder<GetStorageController>(
                init: GetStorageController(),
                builder: (_) {
                  return Text(
                    'Storage by Get :${_.storage.read("email").toString()}',
                    style: TextStyle(fontSize: 20),
                  );
                })
          ],
        ),
      ),
    );
  }
}

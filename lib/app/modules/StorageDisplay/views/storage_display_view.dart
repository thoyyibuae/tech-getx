import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_cli_tech/app/modules/getstorage/controllers/getstorage_controller.dart';

import '../controllers/storage_display_controller.dart';

class StorageDisplayView extends GetView<StorageDisplayController> {
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
            GetBuilder<GetstorageController>(
                init: GetstorageController(),
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

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class GetStorageController extends GetxController {
  //TODO: Implement GetstorageController

  @override
  final storage = GetStorage();
  var email = TextEditingController();
  @override
  void onInit() {
    storage.writeIfNull("email", "");
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}

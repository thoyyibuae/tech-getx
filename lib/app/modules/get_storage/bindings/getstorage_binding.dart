import 'package:get/get.dart';

import '../controllers/getstorage_controller.dart';

class GetStorageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GetStorageController>(
      () => GetStorageController(),
    );
  }
}

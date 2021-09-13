import 'package:get/get.dart';

import '../controllers/storage_display_controller.dart';

class StorageDisplayBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StorageDisplayController>(
      () => StorageDisplayController(),
    );
  }
}

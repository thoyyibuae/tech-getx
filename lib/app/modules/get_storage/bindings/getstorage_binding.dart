import 'package:get/get.dart';

import '../controllers/getstorage_controller.dart';

class GetstorageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GetstorageController>(
      () => GetstorageController(),
    );
  }
}

import 'package:get/get.dart';

import 'package:get_cli_tech/app/modules/StorageDisplay/bindings/storage_display_binding.dart';
import 'package:get_cli_tech/app/modules/getstorage/bindings/getstorage_binding.dart';
import 'package:get_cli_tech/app/modules/getstorage/views/getstorage_view.dart';
import 'package:get_cli_tech/app/modules/home/bindings/home_binding.dart';
import 'package:get_cli_tech/app/modules/home/views/home_view.dart';
import 'package:get_cli_tech/app/modules/storage_display/views/storage_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.GETSTORAGE,
      page: () => GetstorageView(),
      binding: GetstorageBinding(),
    ),
    GetPage(
      name: _Paths.STORAGE_DISPLAY,
      page: () => StorageView(),
      binding: StorageDisplayBinding(),
    ),
  ];
}

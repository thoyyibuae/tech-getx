import 'package:get/get.dart';

import 'package:get_cli_tech/app/modules/get_storage/bindings/get_storage_binding.dart';
import 'package:get_cli_tech/app/modules/get_storage/views/get_storage_view.dart';
import 'package:get_cli_tech/app/modules/get_storage/views/storage_view.dart';
import 'package:get_cli_tech/app/modules/home/bindings/home_binding.dart';
import 'package:get_cli_tech/app/modules/home/views/home_view.dart';

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
      page: () => GetStorageView(),
      binding: GetStorageBinding(),
    ),
    GetPage(
      name: _Paths.STORAGE_DISPLAY,
      page: () => StorageView(),
    ),
    GetPage(
      name: _Paths.GET_STORAGE,
      page: () => GetStorageView(),
      binding: GetStorageBinding(),
    ),
  ];
}

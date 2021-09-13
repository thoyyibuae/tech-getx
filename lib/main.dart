import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_cli_tech/app/modules/home/controllers/home_controller.dart';
import 'package:get_cli_tech/generated/locales.g.dart';

import 'package:get_storage/get_storage.dart';

import 'app/routes/app_pages.dart';

void main() async {
  final homecntrl = Get.put(HomeController());
  await GetStorage.init();

  runApp(
    GetMaterialApp(
      theme: homecntrl.isDark ? ThemeData.light() : ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      locale: Locale('en', 'US'),
      translationsKeys: AppTranslation.translations,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}

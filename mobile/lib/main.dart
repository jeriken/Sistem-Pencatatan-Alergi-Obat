import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobile/app/data/services/app/service.dart';
import 'package:mobile/app/data/services/auth/service.dart';
import 'package:mobile/app/modules/home/bindings/home_binding.dart';
import 'app/modules/login/bindings/login_binding.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Get.putAsync(() => AppService().init());
  await Get.putAsync(() => AuthService().init());

  runApp(
    GetMaterialApp(
      title: "Sistem Alergi",
      initialBinding: HomeBinding(),
      initialRoute: Routes.HOME,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
    ),
  );
}

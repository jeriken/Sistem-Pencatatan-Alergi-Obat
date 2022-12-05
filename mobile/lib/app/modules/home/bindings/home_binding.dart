import 'package:get/get.dart';
import 'package:mobile/app/modules/home/repository/home_repository.dart';

import '../../../data/provider/api.dart';
import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(HomeRepository(MyApi())),
    );
  }
}

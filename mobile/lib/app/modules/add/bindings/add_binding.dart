import 'package:get/get.dart';
import 'package:mobile/app/data/provider/api.dart';
import 'package:mobile/app/modules/add/repository/add_repository.dart';

import '../controllers/add_controller.dart';

class AddBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddController>(
      () => AddController(AddRepository(MyApi())),
    );
  }
}

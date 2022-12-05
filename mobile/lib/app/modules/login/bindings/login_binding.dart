import 'package:get/get.dart';

import '../../../data/provider/api.dart';
import '../controllers/login_controller.dart';
import '../repository/login_repository.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginController(LoginRepository(MyApi())));
  }
}

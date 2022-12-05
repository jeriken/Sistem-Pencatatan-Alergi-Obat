

import 'package:get/get.dart';
import 'package:mobile/app/data/provider/api.dart';
import 'package:mobile/app/data/services/app/repository.dart';
import 'package:get_storage/get_storage.dart';

import '../../../core/values/consts.dart';

class AppService extends GetxService {
  late AppRepository repository;
  late GetStorage box;
  Future<AppService> init() async {
    repository = AppRepository(MyApi());
    box = GetStorage();
    await box.writeIfNull(isLoggedStore, false);
    return this;
  }

  isLogged() => box.read(isLoggedStore);
  changeIsLogged(data) async => box.write(isLoggedStore, data);
}
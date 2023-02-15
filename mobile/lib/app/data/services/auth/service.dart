
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobile/app/core/values/consts.dart';
import 'package:mobile/app/data/services/auth/repository.dart';

import '../../models/auth.dart';
import '../../provider/api.dart';

class AuthService extends GetxService {
  late AuthRepository repository;
  late GetStorage box;
  Future<AuthService> init() async {
    repository = AuthRepository(MyApi());
    box = GetStorage();
    await box.writeIfNull(accessToken, "");
    await box.writeIfNull(userName, "");
    return this;
  }

  dataAccessToken() => box.read(accessToken);
  dataUserName() => box.read(userName);
  dataUserEmail() => box.read(userEmail);
  dataUserAvatar() => box.read(userAvatar);
  changeAccessToken(data) async => box.write(accessToken, data);
  changeUserName(data) async => box.write(userName, data);
  changeUserEmail(data) async => box.write(userEmail, data);
  changeUserAvatar(data) async => box.write(userAvatar, data);

  final userrData = AuthModel().obs;

  login(user) async => await repository.login(user);
}
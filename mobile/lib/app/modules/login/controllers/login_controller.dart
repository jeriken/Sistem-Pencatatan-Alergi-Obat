import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:mobile/app/data/services/app/service.dart';
import 'package:mobile/app/data/services/auth/service.dart';

import '../../../data/services/inactive/service.dart';
import '../../../routes/app_pages.dart';
import '../repository/login_repository.dart';

class LoginController extends GetxController {
  final LoginRepository repository;
  LoginController(this.repository);
  AppService? app;
  AuthService? auth;
  final loginFormKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  //TODO: Implement LoginController

  @override
  void onInit() async {
    app = Get.find<AppService>();
    auth = Get.find<AuthService>();
    addEmail();
    await isLoggedCheck();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  isLoggedCheck() async {
    await Future.delayed(Duration.zero, () {
      if (app!.isLogged()) {
        Get.offNamed(Routes.HOME);
      }
    });
  }

  addEmail(){
    if(auth!.dataUserEmail() != null){
      emailController.text = auth!.dataUserEmail();
    }
  }

  login() async {
    final form = {
      'email': emailController.text,
      'password': passwordController.text,
      'remember': 'true'
    };
    final data = await auth!.login(form);
    if(data.errors == null){
      showSnackbar("Berhasil Masuk");
      app!.changeIsLogged(true);
      auth!.changeAccessToken(data.data.accessToken);
      auth!.changeUserName(data.data.user.name);
      auth!.changeUserEmail(data.data.user.email);
      auth!.changeUserAvatar(data.data.user.avatar);
      Get.offNamed(Routes.HOME);
    }else{
      showSnackbar(data.message);
      app!.changeIsLogged(false);
    }
  }

  SnackbarController showSnackbar(message) {
    return Get.showSnackbar(GetSnackBar(
      message: message,
      duration: const Duration(seconds: 3),
    ));
  }

}

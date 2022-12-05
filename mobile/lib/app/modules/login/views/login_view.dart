import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LoginView'),
        centerTitle: true,
      ),
      body: Form(
        key: controller.loginFormKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: controller.emailController,
              decoration: const InputDecoration(labelText: 'E-mail'),
            ),
            TextFormField(
              controller: controller.passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            TextButton(
              onPressed: () {
                controller.login();
              },
              child: const Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}

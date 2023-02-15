import 'dart:async';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../routes/app_pages.dart';
import '../app/service.dart';
import '../auth/service.dart';

/// Service for handling user auto logout based on user activity
class AutoLogoutService {
  static Timer? _timer;
  static const autoLogoutTimer = 15;
  AppService? app;

  Future<AutoLogoutService> init() async {
    app = Get.find<AppService>();
    return this;
  }

  /// Resets the existing timer and starts a new timer
  void startNewTimer() {
    stopTimer();
    if (app!.isLogged()) {
      _timer = Timer.periodic(const Duration(seconds: autoLogoutTimer), (_) {
        timedOut();
      });
    }
  }

  /// Stops the existing timer if it exists
  void stopTimer() {
    if (_timer != null || (_timer?.isActive != null && _timer!.isActive)) {
      _timer?.cancel();
    }
  }

  void trackUserActivity([_]) async {
    print('User Activity Detected!');
    if (app!.isLogged() && _timer != null) {
      startNewTimer();
    }
  }

  /// Called if the user is inactive for a period of time and opens a dialog
  Future<void> timedOut() async {
    stopTimer();
    if (app!.isLogged()) {
      app!.changeIsLogged(false);
      await Future.delayed(Duration.zero, () {
        Get.offNamed(Routes.LOGIN);
      });
      Get.showSnackbar(GetSnackBar(
      message: "Harap lakukan login ulang",
      duration: const Duration(seconds: 3),
    ));
    }
  }
}

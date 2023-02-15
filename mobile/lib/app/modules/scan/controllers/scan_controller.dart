import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:nfc_manager/nfc_manager.dart';

import '../../../data/services/app/service.dart';
import '../../../data/services/auth/service.dart';
import '../../../routes/app_pages.dart';

class ScanController extends GetxController with StateMixin {
  AppService? app;
  AuthService? auth;
  //TODO: Implement ScanController
  @override
  void onInit() async {
    app = Get.find<AppService>();
    auth = Get.find<AuthService>();
    await isLoggedCheck();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
  
  isLoggedCheck() async {
    await Future.delayed(Duration.zero, () {
      if (app!.isLogged() == false) {
        Get.offNamed(Routes.LOGIN);
      }
    });
  }

  logOut() async {
    app!.changeIsLogged(false);
    auth!.changeAccessToken("");
    auth!.changeUserName("");
    auth!.changeUserEmail("");
    auth!.changeUserAvatar("");

    await Get.offAllNamed(Routes.LOGIN);
  }

  getName() => auth!.dataUserName();
  getEmail() => auth!.dataUserEmail();
  getAvatar() => auth!.dataUserAvatar();

  void scanNfc() async {
    ValueNotifier<dynamic> result = ValueNotifier(null);
    bool isAvailable = await NfcManager.instance.isAvailable();
    if (isAvailable == false) {
      change("Device tidak mendukung",
          status: RxStatus.error("Device tidak memiliki fitur NFC"));
      showSnackbar("Terdapat kesalahan");
    }
    String data;
    NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
      result.value = tag.data;
      print(result.value);
      if(result.value['nfca'] != null){
        data = jsonEncode(result.value['nfca']['identifier']);
      }else if(result.value['nfcb'] != null){
        data = jsonEncode(result.value['nfcb']['applicationData']);
      }else{
        data = "Data tidak cocok";
      }
      print(data);
        change(data, status: RxStatus.success());
        showSnackbar("Berhasil");
      NfcManager.instance.stopSession();
    });
  }

  Future<void> scanBarcode() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Batalkan', true, ScanMode.BARCODE);
      print(barcodeScanRes);
      if (barcodeScanRes != "-1") {
        change(barcodeScanRes, status: RxStatus.success());
        showSnackbar("Berhasil");
      } else {
        change(barcodeScanRes, status: RxStatus.error("Coba scan lagi"));
        showSnackbar("Terjadi Kesalahan");
      }
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
  }

  SnackbarController showSnackbar(message) {
    return Get.showSnackbar(GetSnackBar(
      message: message,
      duration: const Duration(seconds: 3),
    ));
  }
}

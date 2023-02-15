import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/data/services/app/service.dart';
import 'package:mobile/app/data/services/auth/service.dart';
import 'package:mobile/app/modules/home/repository/home_repository.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import 'package:nfc_manager/nfc_manager.dart';

import '../../../routes/app_pages.dart';

class HomeController extends GetxController with StateMixin {
  final HomeRepository repository;
  HomeController(this.repository);
  AppService? app;
  AuthService? auth;
  //TODO: Implement HomeController

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

  // isNfcAvailable() async {
  //   bool isAvailable = await NfcManager.instance.isAvailable();
  //   print(isAvailable);
  //   return isAvailable.toString();
  // }

  void scanNfc() async {
    ValueNotifier<dynamic> result = ValueNotifier(null);
    bool isAvailable = await NfcManager.instance.isAvailable();
    if (isAvailable == false) {
      change("Device tidak mendukung",
          status: RxStatus.error("Device tidak memiliki fitur NFC"));
      showSnackbar("Terdapat kesalahan");
    }
    String datanfc;
    NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
      result.value = tag.data;
      print(result.value);
      if (result.value['nfca'] != null) {
        datanfc = jsonEncode(result.value['nfca']['identifier']);
      } else if (result.value['nfcb'] != null) {
        datanfc = jsonEncode(result.value['nfcb']['applicationData']);
      } else {
        datanfc = "Data tidak cocok";
      }
      final data = await repository.getSearch(datanfc);
      if (data.data != null && data.data.alergi == null) {
        change(data, status: RxStatus.error("Pasien tidak memiliki alergi"));
        showSnackbar("Terdapat kesalahan");
      } else if (data.data == null) {
        change(data, status: RxStatus.error("Pasien tidak terdaftar"));
        showSnackbar("Terdapat kesalahan");
      } else if (data.data != null) {
        change(data, status: RxStatus.success());
        showSnackbar("Berhasil");
      } else {
        change(data.message, status: RxStatus.error(data.message));
        showSnackbar("Terdapat kesalahan");
      }
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
        final data = await repository.getSearch(barcodeScanRes);
        if (data.data != null && data.data.alergi == null) {
          change(data, status: RxStatus.error("Pasien tidak memiliki alergi"));
          showSnackbar("Terdapat kesalahan");
        } else if (data.data == null) {
          change(data, status: RxStatus.error("Pasien tidak terdaftar"));
          showSnackbar("Terdapat kesalahan");
        } else if (data.data != null) {
          change(data, status: RxStatus.success());
          showSnackbar("Berhasil");
        } else {
          change(data.message, status: RxStatus.error(data.message));
          showSnackbar("Terdapat kesalahan");
        }
      }
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
  }

  // getData() async {
  //   final data = await repository.getDashboard();
  //   if (data.errors == null) {
  //     change(data, status: RxStatus.success());
  //   } else {
  //     change(data, status: RxStatus.error(data.message));
  //   }
  // }

  SnackbarController showSnackbar(message) {
    return Get.showSnackbar(GetSnackBar(
      message: message,
      duration: const Duration(seconds: 3),
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:nfc_manager/nfc_manager.dart';

class ScanController extends GetxController {
  //TODO: Implement ScanController
  @override
  void onInit() {
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

  void scanNfc() {
    ValueNotifier<dynamic> result = ValueNotifier(null);
    NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
      result.value = tag.data;
      showingDialog(result.value);
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
        showingDialog(barcodeScanRes);
      }
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
  }

  showingDialog(message) {
    Get.defaultDialog(
        title: "Berhasil",
        titleStyle: const TextStyle(fontSize: 14),
        radius: 5,
        confirmTextColor: Colors.white,
        content: SelectableText(
          message,
          style: const TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
          showCursor: true,
          autofocus: true,
          cursorWidth: 2,
        ));
  }
}

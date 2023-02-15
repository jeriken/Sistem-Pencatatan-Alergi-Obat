import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:nfc_manager/nfc_manager.dart';

import '../../../data/services/app/service.dart';
import '../../../data/services/auth/service.dart';
import '../../../routes/app_pages.dart';
import '../repository/add_repository.dart';

class AddController extends GetxController with StateMixin {
  final AddRepository repository;
  AddController(this.repository);
  AppService? app;
  AuthService? auth;
  final addFormKey = GlobalKey<FormState>();
  final namaLengkap = TextEditingController();
  final rumahSakit = TextEditingController();
  final tempatLahir = TextEditingController();
  final tanggalLahir = TextEditingController();
  final tanggalCatat = TextEditingController();
  final nomorNik = TextEditingController();
  final jenisKelamin = TextEditingController();
  final golonganDarah = TextEditingController();
  final alamat = TextEditingController();
  final keterangan = TextEditingController();
  final alergiObat = TextEditingController();
  final ktp = TextEditingController();
  final agama = TextEditingController();
  final pekerjaan = TextEditingController();
  final bpjs = TextEditingController();
  final noKartu = TextEditingController();
  final fasilitasKesehatan = TextEditingController();
  final checkKtp = false.obs;
  final checkBpjs = false.obs;
  Map<String, int> dataRs = {
    "Puskesmas Karangkobar": 1,
    "Puskesmas Wanayasa": 2,
    "Puskesmas Pagentan 1": 3,
    "Puskesmas Kalibening": 4,
  };
  Map<String, String> dataJk = {
    "Laki-laki": "Laki-laki",
    "Perempuan": "Perempuan",
  };
  Map<String, String> dataGd = {
    "-": "-",
    "AB": "AB",
    "A": "A",
    "B": "B",
    "O": "O",
  };
  Map<String, String> dataA = {
    "Islam": "Islam",
    "Protestan": "Protestan",
    "Katolik": "Katolik",
    "Hindu": "Hindu",
    "Buddha": "Buddha",
    "Khonghucu": "Khonghucu",
  };
  //TODO: Implement AddController

  final count = 0.obs;
  @override
  void onInit() async {
    app = Get.find<AppService>();
    auth = Get.find<AuthService>();
    await isLoggedCheck();
    await getRelationship();
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

  getRelationship() async {
    final data = await repository.getRelation();
    if (data.data != null) {
      change(data, status: RxStatus.success());
    }
  }

  addData() async {
    final form = {
      'data': {
        'nama': namaLengkap.text,
        'rs_id': rumahSakit.text,
        'tmp_lahir': tempatLahir.text,
        'tgl_lahir': tanggalLahir.text,
        'tgl_catat': tanggalCatat.text,
        'nik': nomorNik.text,
        'jenkel': jenisKelamin.text,
        'goldar': golonganDarah.text,
        'alamat': alamat.text,
        'keterangan': keterangan.text
      }
    };

    final data = await repository.sendData(form);
    if (data.errors == null) {
      if (alergiObat.text.isNotEmpty) {
        final formObat = {
          'data': {'data': alergiObat.text, 'ids': data.data.id}
        };
        final dataObat = await repository.sendObat(formObat);
      }
      if (ktp.text.isNotEmpty) {
        final formKtp = {
          'data': {
            'rfid': ktp.text,
            'agama': agama.text,
            'pekerjaan': pekerjaan.text,
            'ids': data.data.id
          }
        };
        final dataKtp = await repository.sendKtp(formKtp);
      }
      if (bpjs.text.isNotEmpty) {
        final formBpjs = {
          'data': {
            'barcode': bpjs.text,
            'nomor': noKartu.text,
            'faskes': fasilitasKesehatan.text,
            'ids': data.data.id
          }
        };
        final dataBpjs = await repository.sendBpjs(formBpjs);
      }
      showSnackbar("Data pasien berhasil ditambahkan");
      Get.offNamed(Routes.HOME);
    } else {
      showSnackbar(data.message);
    }
  }

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
      if (result.value['nfca'] != null) {
        data = jsonEncode(result.value['nfca']['identifier']);
      } else if (result.value['nfcb'] != null) {
        data = jsonEncode(result.value['nfcb']['applicationData']);
      } else {
        data = "Data tidak cocok";
      }
      ktp.text = data;
      checkKtp.toggle();
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
        bpjs.text = barcodeScanRes;
        checkBpjs.toggle();
        showSnackbar("Berhasil");
      } else {
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

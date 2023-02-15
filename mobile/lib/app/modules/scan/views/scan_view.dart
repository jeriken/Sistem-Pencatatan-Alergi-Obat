import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../home/controllers/home_controller.dart';
import '../controllers/scan_controller.dart';

class ScanView extends GetView<ScanController> {
  const ScanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scanner'),
        backgroundColor: const Color(0xFF06bbd3),
        centerTitle: true,
      ),
      drawer: const DrawerWidget(),
      body: Column(
        children: [
          Container(
              padding: const EdgeInsets.all(30),
              child: const Text(
                "Pilih kartu yang digunakan pasien",
                style: TextStyle(fontSize: 20),
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 125,
                height: 40,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    border:
                        Border.all(color: const Color(0xFF06bbd3), width: 1)),
                child: MaterialButton(
                  onPressed: () => controller.scanNfc(),
                  child: const Text('Kartu KTP'),
                ),
              ),
              Container(
                width: 125,
                height: 40,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: const Color(0xFF06bbd3),
                    borderRadius: BorderRadius.circular(5)),
                child: MaterialButton(
                  onPressed: () => controller.scanBarcode(),
                  child: const Text(
                    'Kartu BPJS',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          controller.obx(
            (state) => Container(
              margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 22),
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: const Color(0xFF06bbd3), width: 1)),
              child: Column(
                children: [
                  const Text("ID dari kartu yang digunakan:"),
                  const SizedBox(
                    height: 10,
                  ),
                  SelectableText(
                    state,
                    style: const TextStyle(fontSize: 20),
                    showCursor:true,
                    autofocus: true,
                  ),
                ],
              ),
            ),
            onEmpty: const Center(),
            onLoading: const Center(),
            onError: (error) => Container(
              margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 22),
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: const Color(0xFF06bbd3), width: 1)),
              child: Column(
                children: [
                  Text(
                    error.toString(),
                    style: const TextStyle(fontSize: 20),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DrawerWidget extends GetView<ScanController> {
  const DrawerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        //di dalam listview ini terdapat beberapa widget drawable
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(
              color: Color(0xFF06bbd3),
            ),
            //membuat gambar profil
            currentAccountPicture:
                Image(image: NetworkImage(controller.getAvatar())),
            //membuat nama akun
            accountName: Text(controller.getName()),
            //membuat nama email
            accountEmail: Text(controller.getEmail()),
            //memberikan background
          ),
          //membuat list menu
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text("Beranda"),
            onTap: () => Get.offNamed(Routes.HOME),
          ),
          ListTile(
            leading: const Icon(Icons.scanner),
            title: const Text("Scanner"),
            onTap: () => Get.offNamed(Routes.SCAN),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text("Keluar"),
            onTap: () => controller.logOut(),
          ),
        ],
      ),
    );
  }
}

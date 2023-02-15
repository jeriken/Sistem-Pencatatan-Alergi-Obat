import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mobile/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Beranda'),
          backgroundColor: const Color(0xFF06bbd3),
          centerTitle: true,
        ),
        drawer: const DrawerWidget(),
        body: SingleChildScrollView(
          child: Column(
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
                        border: Border.all(
                            color: const Color(0xFF06bbd3), width: 1)),
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
                  margin:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 22),
                  padding: const EdgeInsets.all(10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      border:
                          Border.all(color: const Color(0xFF06bbd3), width: 1)),
                  child: Column(
                    children: [
                      const Text("Pasien memiliki alergi obat:"),
                      const SizedBox(
                        height: 10,
                      ),
                      (state.data.alergi.data != null)
                          ? Text(
                              state.data.alergi.data,
                              style: const TextStyle(fontSize: 20),
                            )
                          : const Center(),
                      const SizedBox(
                        height: 5,
                      ),
                      (state.data.keterangan != null)
                          ? Text(
                              state.data.keterangan,
                              style: const TextStyle(fontSize: 20),
                            )
                          : const Center()
                    ],
                  ),
                ),
                onEmpty: const Center(),
                onLoading: const Center(),
                onError: (error) => Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 22),
                  padding: const EdgeInsets.all(10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      border:
                          Border.all(color: const Color(0xFF06bbd3), width: 1)),
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
              // ListView.builder(
              //     shrinkWrap: true,
              //     itemCount: state.data.lastPasien.length,
              //     itemBuilder: (context, index) =>
              //         Text(state.data.lastPasien[index].nama)),
            ],
          ),
        ));
  }
}

class DrawerWidget extends GetView<HomeController> {
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
            leading: const Icon(Icons.add),
            title: const Text("Tambah Data"),
            onTap: () => Get.offNamed(Routes.ADD),
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

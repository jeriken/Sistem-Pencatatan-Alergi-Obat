import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:get/get.dart';
import 'package:mobile/app/data/models/relation.dart';

import '../../../routes/app_pages.dart';
import '../controllers/add_controller.dart';

class AddView extends GetView<AddController> {
  const AddView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Tambah Data'),
          backgroundColor: const Color(0xFF06bbd3),
          centerTitle: true,
        ),
        drawer: const DrawerWidget(),
        body: SingleChildScrollView(
          child: Form(
              key: controller.addFormKey,
              child: controller.obx((state) => Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 20.0, bottom: 20),
                        child:
                            Text('Isi data berikut dengan benar dan lengkap'),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 15),
                        child: TextFormField(
                          controller: controller.namaLengkap,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              alignLabelWithHint: true,
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              labelText: 'Nama Lengkap',
                              hintText: 'Supriyati'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Harap isi data ini!';
                            }
                            return null;
                          },
                        ),
                      ),
                      //Text(state.data.rs[0].nama.toString()),
                      Container(
                        margin: const EdgeInsets.only(
                            left: 15.0, right: 15.0, top: 15, bottom: 0),
                        child: DropdownButtonFormField(
                          items: controller.dataRs.keys.map((String value) {
                            return DropdownMenuItem(
                              value: controller.dataRs[value],
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (value) =>
                              controller.rumahSakit.text = value.toString(),
                              validator: (value) {
                            if (value == null) {
                              return 'Harap isi data ini!';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Rumah Sakit',
                              hintText: 'Pilih Rumah Sakit'),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                            left: 15.0, right: 15.0, top: 15, bottom: 0),
                        child: TextFormField(
                          controller: controller.tempatLahir,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Harap isi data ini!';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Tempat Lahir',
                              hintText: 'Banjarnegara'),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                            left: 15.0, right: 15.0, top: 15, bottom: 0),
                        child: TextFormField(
                          controller: controller.tanggalLahir,
                          onTap: () async {
                            showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1940),
                                    lastDate: DateTime.now())
                                .then((value) => controller.tanggalLahir.text =
                                    DateFormat('y-MM-DD')
                                        .format(value!)
                                        .toString());
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Harap isi data ini!';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Tanggal Lahir',
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                            left: 15.0, right: 15.0, top: 15, bottom: 0),
                        child: TextFormField(
                          controller: controller.tanggalCatat,
                          onTap: () async {
                            showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2018),
                                    lastDate: DateTime.now())
                                .then((value) => controller.tanggalCatat.text =
                                    DateFormat('y-MM-DD')
                                        .format(value!)
                                        .toString());
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Harap isi data ini!';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Tanggal Catat',
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                            left: 15.0, right: 15.0, top: 15, bottom: 0),
                        child: TextFormField(
                          controller: controller.nomorNik,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Harap isi data ini!';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'NIK',
                              hintText: '3304XXXXXXXXXXXXXXXXX'),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                            left: 15.0, right: 15.0, top: 15, bottom: 0),
                        child: DropdownButtonFormField(
                          items: controller.dataJk.keys.map((String value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (value) =>
                              controller.jenisKelamin.text = value.toString(),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Harap isi data ini!';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Jenis Kelamin',
                              hintText: 'Pilih Jenis Kelamin'),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                            left: 15.0, right: 15.0, top: 15, bottom: 0),
                        child: DropdownButtonFormField(
                          items: controller.dataGd.keys.map((String value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (value) =>
                              controller.golonganDarah.text = value.toString(),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Harap isi data ini!';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Golongan Darah',
                              hintText: 'Pilih Golongan Darah'),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                            left: 15.0, right: 15.0, top: 15, bottom: 0),
                        child: TextFormField(
                          controller: controller.alamat,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Harap isi data ini!';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Alamat',
                              hintText: 'Jl kenari no 1'),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                            left: 15.0, right: 15.0, top: 15, bottom: 0),
                        child: TextFormField(
                          controller: controller.keterangan,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Harap isi data ini!';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Keterangan',
                              hintText: 'RM. 187XX'),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        child: Text('Isi data Alergi Obat'),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 15),
                        child: TextFormField(
                          controller: controller.alergiObat,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Harap isi data ini!';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Alergi Obat',
                              hintText: 'Amoksisilin'),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        child: Text('Isi data KTP (opsional)'),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 15),
                        child: TextField(
                          controller: controller.ktp,
                          onTap: () => controller.scanNfc(),
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Data KTP',
                          ),
                        ),
                      ),
                      Obx(() => Visibility(
                            visible: controller.checkKtp.isTrue,
                            child: Column(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(
                                      left: 15.0,
                                      right: 15.0,
                                      top: 15,
                                      bottom: 0),
                                  child: DropdownButtonFormField(
                                    items: controller.dataA.keys
                                        .map((String value) {
                                      return DropdownMenuItem(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                    onChanged: (value) => controller
                                        .agama.text = value.toString(),
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'Agama',
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(
                                      left: 15.0,
                                      right: 15.0,
                                      top: 15,
                                      bottom: 0),
                                  child: TextField(
                                    controller: controller.pekerjaan,
                                    decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'Pekerjaan',
                                        hintText: 'Wiraswasta'),
                                  ),
                                ),
                              ],
                            ),
                          )),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        child: Text('Isi data Kartu BPJS (opsional)'),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 15),
                        child: TextField(
                          controller: controller.bpjs,
                          onTap: () => controller.scanBarcode(),
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Data BPJS',
                          ),
                        ),
                      ),
                      Obx(() => Visibility(
                            visible: controller.checkBpjs.isTrue,
                            child: Column(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(
                                      left: 15.0,
                                      right: 15.0,
                                      top: 15,
                                      bottom: 0),
                                  child: TextField(
                                    controller: controller.noKartu,
                                    decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'Nomor Kartu',
                                        hintText: '4598347'),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(
                                      left: 15.0,
                                      right: 15.0,
                                      top: 15,
                                      bottom: 0),
                                  child: TextField(
                                    controller: controller.fasilitasKesehatan,
                                    decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'Fasilitas Kesehatan',
                                        hintText: 'Tingkat 1 : Klinik'),
                                  ),
                                ),
                              ],
                            ),
                          )),
                      Container(
                        height: 46,
                        width: 250,
                        margin: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: const Color(0xFF06bbd3),
                            borderRadius: BorderRadius.circular(23)),
                        child: MaterialButton(
                          onPressed: () {
                            if (controller.addFormKey.currentState!
                                .validate()) {
                              Get.defaultDialog(
                                titlePadding: const EdgeInsets.all(20),
                                title: "Konfirmasikan Data",
                                contentPadding:
                                    const EdgeInsets.only(bottom: 20),
                                content: konfirmasiData(),
                                onConfirm: () => controller.addData(),
                                onCancel: () => Get.back(),
                                textConfirm: "Konfirmasi",
                                textCancel: "Batalkan",
                              );
                            }
                          },
                          child: const Text(
                            'Submit',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      )
                    ],
                  ))),
        ));
  }

  SizedBox konfirmasiData() {
    return SizedBox(
      width: Get.width,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Nama Lengkap :"),
                Text(controller.namaLengkap.text)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Rumah Sakit :"),
                Text(controller.rumahSakit.text)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Tempat Lahir :"),
                Text(controller.tempatLahir.text)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Tanggal Lahir :"),
                Text(controller.tanggalLahir.text)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Tanggal Catat :"),
                Text(controller.tanggalCatat.text)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [const Text("NIK :"), Text(controller.nomorNik.text)],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Jenis Kelamin :"),
                Text(controller.jenisKelamin.text)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Golongan Darah :"),
                Text(controller.golonganDarah.text)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [const Text("Alamat :"), Text(controller.alamat.text)],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Keterangan :"),
                Text(controller.keterangan.text)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Alergi Obat :"),
                Text(controller.alergiObat.text)
              ],
            ),
          ),
          if (controller.ktp.text.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [const Text("KTP :"), Text(controller.ktp.text)],
              ),
            ),
          if (controller.ktp.text.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [const Text("Agama :"), Text(controller.agama.text)],
              ),
            ),
          if (controller.ktp.text.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Pekerjaan :"),
                  Text(controller.pekerjaan.text)
                ],
              ),
            ),
          if (controller.bpjs.text.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [const Text("BPJS :"), Text(controller.bpjs.text)],
              ),
            ),
          if (controller.bpjs.text.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Nomor Kartu :"),
                  Text(controller.noKartu.text)
                ],
              ),
            ),
          if (controller.bpjs.text.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Fasilitas Kesehatan :"),
                  Text(controller.fasilitasKesehatan.text)
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class DrawerWidget extends GetView<AddController> {
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

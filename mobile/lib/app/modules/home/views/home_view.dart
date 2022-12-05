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
          title: const Text('HomeView'),
          centerTitle: true,
        ),
        body: Column(
              children: [
                // Text(controller.isNfcAvailable()),
                // (controller.isNfcAvailable()) ? TextButton(
                //   onPressed: () => controller.scanNfc(),
                //   child: const Text(
                //     'Scan Barcode',
                //   ),
                // ) : const Text("NFC is not available"),
                TextButton(
                  onPressed: () => controller.scanNfc(),
                  child: const Text(
                    'Scan NFC',
                  ),
                ),
                TextButton(
                  onPressed: () => controller.scanBarcode(),
                  child: const Text(
                    'Scan Barcode',
                  ),
                ),
                controller.obx((state) => Column(
                  children: [
                    Text(state.data.nama),
                    Text(state.data.jenkel),
                    Text(state.data.alamat),
                    Text(state.data.rs.nama),
                  ],
                ),
                onEmpty: const Center(),
                onLoading: const Center(),
                onError: (error) => Text(error.toString()),
                ),
                // ListView.builder(
                //     shrinkWrap: true,
                //     itemCount: state.data.lastPasien.length,
                //     itemBuilder: (context, index) =>
                //         Text(state.data.lastPasien[index].nama)),
                TextButton(
                  onPressed: () => Get.toNamed(Routes.SCAN),
                  child: const Text(
                    'Scan Only',
                  ),
                ),
                TextButton(
                  onPressed: () => controller.logOut(),
                  child: const Text(
                    'LogOut',
                  ),
                )
              ],
            ));
  }
}

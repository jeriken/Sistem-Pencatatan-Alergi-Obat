import 'dart:convert';

import 'package:get/get.dart';
import 'package:mobile/app/data/models/auth.dart';
import 'package:mobile/app/core/values/consts.dart';
import 'package:mobile/app/data/models/dashboard.dart';
import 'package:mobile/app/data/models/pasien.dart';
import 'package:mobile/app/data/services/auth/service.dart';

class MyApi extends GetConnect {
  AuthService? auth;

  login(data) async {
    final response = await post('$baseUrl/auth/login', data);
    return AuthModel.fromJson(response.body);
  }

  getDashboard() async {
    auth = Get.find<AuthService>();
    final header = {
      'Authorization': 'Bearer ${auth!.dataAccessToken()}',
    };
    final response = await get('$baseUrl/custom/dashboard', headers: header);
    return DashboardModel.fromJson(response.body);
  }

  getSearch(q) async {
    auth = Get.find<AuthService>();
    final header = {
      'Authorization': 'Bearer ${auth!.dataAccessToken()}',
    };
    final response = await get('$baseUrl/custom/search?q=$q', headers: header);
    return PasienModel.fromJson(response.body);
  }
}
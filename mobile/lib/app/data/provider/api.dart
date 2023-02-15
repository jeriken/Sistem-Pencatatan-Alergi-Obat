import 'dart:convert';

import 'package:get/get.dart';
import 'package:mobile/app/data/models/auth.dart';
import 'package:mobile/app/core/values/consts.dart';
import 'package:mobile/app/data/models/bpjs.dart';
import 'package:mobile/app/data/models/dashboard.dart';
import 'package:mobile/app/data/models/ktp.dart';
import 'package:mobile/app/data/models/pasien.dart';
import 'package:mobile/app/data/models/relation.dart';
import 'package:mobile/app/data/models/send.dart';
import 'package:mobile/app/data/services/auth/service.dart';

import '../models/obat.dart';

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

  getRelation() async {
    auth = Get.find<AuthService>();
    final header = {
      'Authorization': 'Bearer ${auth!.dataAccessToken()}',
    };
    final response = await get('$baseUrl/table/relation-data-by-slug?slug=pasien', headers: header);
    return RelationModel.fromJson(response.body);
  }

  sendData(data) async {
    auth = Get.find<AuthService>();
    final header = {
      'Authorization': 'Bearer ${auth!.dataAccessToken()}',
    };
    final response = await post('$baseUrl/entities/pasien/add', data, headers: header);
    print(data);
    print(response.body['message']);
    return SendModel.fromJson(response.body);
  }

  sendKtp(data) async {
    auth = Get.find<AuthService>();
    final header = {
      'Authorization': 'Bearer ${auth!.dataAccessToken()}',
    };
    final response = await post('$baseUrl/entities/ktp/add', data, headers: header);
    return KtpModel.fromJson(response.body);
  }

  sendBpjs(data) async {
    auth = Get.find<AuthService>();
    final header = {
      'Authorization': 'Bearer ${auth!.dataAccessToken()}',
    };
    final response = await post('$baseUrl/entities/bpjs/add', data, headers: header);
    return BpjsModel.fromJson(response.body);
  }

  sendObat(data) async {
    auth = Get.find<AuthService>();
    final header = {
      'Authorization': 'Bearer ${auth!.dataAccessToken()}',
    };
    final response = await post('$baseUrl/entities/alergi/add', data, headers: header);
    return ObatModel.fromJson(response.body);
  }
}
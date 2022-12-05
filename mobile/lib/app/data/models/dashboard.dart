class DashboardModel {
  String? message;
  Data? data;
  String? errors;

  DashboardModel({this.message, this.data, this.errors});

  DashboardModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    errors = json['errors'] != null ? "Error terjadi" : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    if (this.errors != null) {
      data['errors'] = this.errors;
    }
    return data;
  }
}

class Data {
  int? pasienCount;
  int? rsCount;
  int? ktpCount;
  int? bpjsCount;
  int? alergiCount;
  List<LastPasien>? lastPasien;
  List<RumahSakit>? rumahSakit;

  Data(
      {this.pasienCount,
      this.rsCount,
      this.ktpCount,
      this.bpjsCount,
      this.alergiCount,
      this.lastPasien,
      this.rumahSakit});

  Data.fromJson(Map<String, dynamic> json) {
    pasienCount = json['pasienCount'];
    rsCount = json['rsCount'];
    ktpCount = json['ktpCount'];
    bpjsCount = json['bpjsCount'];
    alergiCount = json['alergiCount'];
    if (json['lastPasien'] != null) {
      lastPasien = <LastPasien>[];
      json['lastPasien'].forEach((v) {
        lastPasien!.add(new LastPasien.fromJson(v));
      });
    }
    if (json['rumahSakit'] != null) {
      rumahSakit = <RumahSakit>[];
      json['rumahSakit'].forEach((v) {
        rumahSakit!.add(new RumahSakit.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pasienCount'] = this.pasienCount;
    data['rsCount'] = this.rsCount;
    data['ktpCount'] = this.ktpCount;
    data['bpjsCount'] = this.bpjsCount;
    data['alergiCount'] = this.alergiCount;
    if (this.lastPasien != null) {
      data['lastPasien'] = this.lastPasien!.map((v) => v.toJson()).toList();
    }
    if (this.rumahSakit != null) {
      data['rumahSakit'] = this.rumahSakit!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LastPasien {
  int? id;
  String? nama;
  String? tmpLahir;
  String? tglLahir;
  String? alamat;
  String? goldar;
  String? nik;
  String? ktpId;
  String? bpjsId;
  String? alergiId;
  String? createdAt;
  String? updatedAt;
  String? rsId;
  String? jenkel;
  String? keterangan;
  String? tglCatat;
  Rs? rs;
  Null? ktp;
  Null? bpjs;
  Alergi? alergi;

  LastPasien(
      {this.id,
      this.nama,
      this.tmpLahir,
      this.tglLahir,
      this.alamat,
      this.goldar,
      this.nik,
      this.ktpId,
      this.bpjsId,
      this.alergiId,
      this.createdAt,
      this.updatedAt,
      this.rsId,
      this.jenkel,
      this.keterangan,
      this.tglCatat,
      this.rs,
      this.ktp,
      this.bpjs,
      this.alergi});

  LastPasien.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['nama'];
    tmpLahir = json['tmpLahir'];
    tglLahir = json['tglLahir'];
    alamat = json['alamat'];
    goldar = json['goldar'];
    nik = json['nik'];
    ktpId = json['ktpId'];
    bpjsId = json['bpjsId'];
    alergiId = json['alergiId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    rsId = json['rsId'];
    jenkel = json['jenkel'];
    keterangan = json['keterangan'];
    tglCatat = json['tglCatat'];
    rs = json['rs'] != null ? new Rs.fromJson(json['rs']) : null;
    ktp = json['ktp'];
    bpjs = json['bpjs'];
    alergi =
        json['alergi'] != null ? new Alergi.fromJson(json['alergi']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nama'] = this.nama;
    data['tmpLahir'] = this.tmpLahir;
    data['tglLahir'] = this.tglLahir;
    data['alamat'] = this.alamat;
    data['goldar'] = this.goldar;
    data['nik'] = this.nik;
    data['ktpId'] = this.ktpId;
    data['bpjsId'] = this.bpjsId;
    data['alergiId'] = this.alergiId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['rsId'] = this.rsId;
    data['jenkel'] = this.jenkel;
    data['keterangan'] = this.keterangan;
    data['tglCatat'] = this.tglCatat;
    if (this.rs != null) {
      data['rs'] = this.rs!.toJson();
    }
    data['ktp'] = this.ktp;
    data['bpjs'] = this.bpjs;
    if (this.alergi != null) {
      data['alergi'] = this.alergi!.toJson();
    }
    return data;
  }
}

class Rs {
  int? id;
  String? nama;
  String? alamat;
  String? telepon;
  String? provinsi;
  String? createdAt;
  String? updatedAt;

  Rs(
      {this.id,
      this.nama,
      this.alamat,
      this.telepon,
      this.provinsi,
      this.createdAt,
      this.updatedAt});

  Rs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['nama'];
    alamat = json['alamat'];
    telepon = json['telepon'];
    provinsi = json['provinsi'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nama'] = this.nama;
    data['alamat'] = this.alamat;
    data['telepon'] = this.telepon;
    data['provinsi'] = this.provinsi;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class Alergi {
  int? id;
  String? data;
  String? createdAt;
  String? updatedAt;

  Alergi({this.id, this.data, this.createdAt, this.updatedAt});

  Alergi.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    data = json['data'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['data'] = this.data;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class RumahSakit {
  int? id;
  String? nama;
  String? alamat;
  String? telepon;
  String? provinsi;
  String? createdAt;
  String? updatedAt;
  String? pasienCount;

  RumahSakit(
      {this.id,
      this.nama,
      this.alamat,
      this.telepon,
      this.provinsi,
      this.createdAt,
      this.updatedAt,
      this.pasienCount});

  RumahSakit.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['nama'];
    alamat = json['alamat'];
    telepon = json['telepon'];
    provinsi = json['provinsi'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    pasienCount = json['pasienCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nama'] = this.nama;
    data['alamat'] = this.alamat;
    data['telepon'] = this.telepon;
    data['provinsi'] = this.provinsi;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['pasienCount'] = this.pasienCount;
    return data;
  }
}
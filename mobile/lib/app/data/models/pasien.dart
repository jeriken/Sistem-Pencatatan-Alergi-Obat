class PasienModel {
  String? message;
  Data? data;
  String? errors;

  PasienModel({this.message, this.data, this.errors});

  PasienModel.fromJson(Map<String, dynamic> json) {
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
  String? deletedAt;
  String? rsId;
  String? jenkel;
  String? keterangan;
  String? tglCatat;
  Rs? rs;
  Ktp? ktp;
  Bpjs? bpjs;
  Alergi? alergi;

  Data(
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
      this.deletedAt,
      this.rsId,
      this.jenkel,
      this.keterangan,
      this.tglCatat,
      this.rs,
      this.ktp,
      this.bpjs,
      this.alergi});

  Data.fromJson(Map<String, dynamic> json) {
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
    deletedAt = json['deletedAt'];
    rsId = json['rsId'];
    jenkel = json['jenkel'];
    keterangan = json['keterangan'];
    tglCatat = json['tglCatat'];
    rs = json['rs'] != null ? new Rs.fromJson(json['rs']) : null;
    ktp = json['ktp'] != null ? new Ktp.fromJson(json['ktp']) : null;
    bpjs = json['bpjs'] != null ? new Bpjs.fromJson(json['bpjs']) : null;
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
    data['deletedAt'] = this.deletedAt;
    data['rsId'] = this.rsId;
    data['jenkel'] = this.jenkel;
    data['keterangan'] = this.keterangan;
    data['tglCatat'] = this.tglCatat;
    if (this.rs != null) {
      data['rs'] = this.rs!.toJson();
    }
    if (this.ktp != null) {
      data['ktp'] = this.ktp!.toJson();
    }
    if (this.bpjs != null) {
      data['bpjs'] = this.bpjs!.toJson();
    }
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

class Ktp {
  int? id;
  String? rfid;
  String? agama;
  String? pekerjaan;
  String? createdAt;
  String? updatedAt;

  Ktp(
      {this.id,
      this.rfid,
      this.agama,
      this.pekerjaan,
      this.createdAt,
      this.updatedAt});

  Ktp.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    rfid = json['rfid'];
    agama = json['agama'];
    pekerjaan = json['pekerjaan'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['rfid'] = this.rfid;
    data['agama'] = this.agama;
    data['pekerjaan'] = this.pekerjaan;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class Bpjs {
  int? id;
  String? barcode;
  String? nomor;
  String? faskes;
  String? createdAt;
  String? updatedAt;

  Bpjs(
      {this.id,
      this.barcode,
      this.nomor,
      this.faskes,
      this.createdAt,
      this.updatedAt});

  Bpjs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    barcode = json['barcode'];
    nomor = json['nomor'];
    faskes = json['faskes'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['barcode'] = this.barcode;
    data['nomor'] = this.nomor;
    data['faskes'] = this.faskes;
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
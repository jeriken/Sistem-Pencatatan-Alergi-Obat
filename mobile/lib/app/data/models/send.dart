class SendModel {
  String? message;
  Data? data;
  String? errors;

  SendModel({this.message, this.data, this.errors});

  SendModel.fromJson(Map<String, dynamic> json) {
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
  String? id;
  String? nama;
  String? tmpLahir;
  String? tglLahir;
  String? alamat;
  String? goldar;
  String? nik;
  Null? ktpId;
  Null? bpjsId;
  Null? alergiId;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;
  String? rsId;
  String? jenkel;
  String? keterangan;
  String? tglCatat;

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
      this.tglCatat});

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
    return data;
  }
}

class RelationModel {
  String? message;
  Null? errors;
  Data? data;

  RelationModel({this.message, this.errors, this.data});

  RelationModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    errors = json['errors'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['errors'] = this.errors;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<Ktp>? ktp;
  List<Bpjs>? bpjs;
  List<Alergi>? alergi;
  List<Rs>? rs;

  Data({this.ktp, this.bpjs, this.alergi, this.rs});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['ktp'] != null) {
      ktp = <Ktp>[];
      json['ktp'].forEach((v) {
        ktp!.add(new Ktp.fromJson(v));
      });
    }
    if (json['bpjs'] != null) {
      bpjs = <Bpjs>[];
      json['bpjs'].forEach((v) {
        bpjs!.add(new Bpjs.fromJson(v));
      });
    }
    if (json['alergi'] != null) {
      alergi = <Alergi>[];
      json['alergi'].forEach((v) {
        alergi!.add(new Alergi.fromJson(v));
      });
    }
    if (json['rs'] != null) {
      rs = <Rs>[];
      json['rs'].forEach((v) {
        rs!.add(new Rs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.ktp != null) {
      data['ktp'] = this.ktp!.map((v) => v.toJson()).toList();
    }
    if (this.bpjs != null) {
      data['bpjs'] = this.bpjs!.map((v) => v.toJson()).toList();
    }
    if (this.alergi != null) {
      data['alergi'] = this.alergi!.map((v) => v.toJson()).toList();
    }
    if (this.rs != null) {
      data['rs'] = this.rs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Ktp {
  String? rfid;
  String? value;
  String? label;

  Ktp({this.rfid, this.value, this.label});

  Ktp.fromJson(Map<String, dynamic> json) {
    rfid = json['rfid'];
    value = json['value'];
    label = json['label'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rfid'] = this.rfid;
    data['value'] = this.value;
    data['label'] = this.label;
    return data;
  }
}

class Bpjs {
  String? barcode;
  String? nomor;
  String? value;
  String? label;

  Bpjs({this.barcode, this.nomor, this.value, this.label});

  Bpjs.fromJson(Map<String, dynamic> json) {
    barcode = json['barcode'];
    nomor = json['nomor'];
    value = json['value'];
    label = json['label'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['barcode'] = this.barcode;
    data['nomor'] = this.nomor;
    data['value'] = this.value;
    data['label'] = this.label;
    return data;
  }
}

class Alergi {
  String? id;
  String? data;
  String? value;
  String? label;

  Alergi({this.id, this.data, this.value, this.label});

  Alergi.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    data = json['data'];
    value = json['value'];
    label = json['label'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['data'] = this.data;
    data['value'] = this.value;
    data['label'] = this.label;
    return data;
  }
}

class Rs {
  String? id;
  String? nama;
  String? value;
  String? label;

  Rs({this.id, this.nama, this.value, this.label});

  Rs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['nama'];
    value = json['value'];
    label = json['label'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nama'] = this.nama;
    data['value'] = this.value;
    data['label'] = this.label;
    return data;
  }
}

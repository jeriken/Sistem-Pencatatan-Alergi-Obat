class BpjsModel {
  String? message;
  Data? data;
  Null? errors;

  BpjsModel({this.message, this.data, this.errors});

  BpjsModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    errors = json['errors'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['errors'] = this.errors;
    return data;
  }
}

class Data {
  String? id;
  String? barcode;
  String? nomor;
  String? faskes;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.barcode,
      this.nomor,
      this.faskes,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
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

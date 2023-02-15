class KtpModel {
  String? message;
  Data? data;
  Null? errors;

  KtpModel({this.message, this.data, this.errors});

  KtpModel.fromJson(Map<String, dynamic> json) {
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
  String? rfid;
  String? agama;
  String? pekerjaan;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.rfid,
      this.agama,
      this.pekerjaan,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
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

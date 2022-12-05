class AuthModel {
  String? message;
  String? errors;
  Data? data;

  AuthModel({this.message, this.errors, this.data});

  AuthModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    errors = json['errors'] != null ? "Error terjadi" : null;
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.errors != null) {
      data['errors'] = this.errors;
    }
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? accessToken;
  String? tokenType;
  User? user;
  int? expiresIn;

  Data({this.accessToken, this.tokenType, this.user, this.expiresIn});

  Data.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    tokenType = json['tokenType'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    expiresIn = json['expiresIn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accessToken'] = this.accessToken;
    data['tokenType'] = this.tokenType;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['expiresIn'] = this.expiresIn;
    return data;
  }
}

class User {
  String? id;
  String? name;
  String? username;
  String? email;
  Null? additionalInfo;
  String? avatar;
  String? emailVerifiedAt;
  Null? rememberToken;
  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
      this.name,
      this.username,
      this.email,
      this.additionalInfo,
      this.avatar,
      this.emailVerifiedAt,
      this.rememberToken,
      this.createdAt,
      this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    email = json['email'];
    additionalInfo = json['additionalInfo'];
    avatar = json['avatar'];
    emailVerifiedAt = json['emailVerifiedAt'];
    rememberToken = json['rememberToken'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['username'] = this.username;
    data['email'] = this.email;
    data['additionalInfo'] = this.additionalInfo;
    data['avatar'] = this.avatar;
    data['emailVerifiedAt'] = this.emailVerifiedAt;
    data['rememberToken'] = this.rememberToken;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
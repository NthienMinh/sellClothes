import 'dart:convert';

class User {
  int? userId;
  String? userFullName;
  String? userEmail;
  String? userPassword;
  String? userPhoneNumber;
  String? userAdress;

  User({
    this.userId,
    this.userFullName,
    this.userEmail,
    this.userPassword,
    this.userPhoneNumber,
    this.userAdress,
  });

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
        userId: json["user_id"],
        userFullName: json["user_full_name"],
        userEmail: json["user_email"],
        userPassword: json["user_password"],
        userPhoneNumber: json["user_phone_number"],
        userAdress: json["user_address"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "user_full_name": userFullName,
        "user_email": userEmail,
        "user_password": userPassword,
        "user_phone_number": userPhoneNumber,
        "user_address": userAdress,
      };
}

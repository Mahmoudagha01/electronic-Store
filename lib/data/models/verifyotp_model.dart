import 'dart:convert';

class OtpModel {
  int status;
  String message;
  Account ? account;
  OtpModel({
    required this.status,
    required this.message,
    required this.account,
  });
  factory OtpModel.fromJson(Map<String, dynamic> json) => OtpModel(
        status: json["status"],
        message: json["message"],
        account:json["account"]==null?null: Account.fromJson(json["account"]),
      );
}

class Account {
  int id;
  String name;
  String phone;
  Account({required this.id, required this.name, required this.phone});

  factory Account.fromJson(Map<String, dynamic> json) =>
      Account(id: json["id"], name: json["name"], phone: json["phone"]);
}

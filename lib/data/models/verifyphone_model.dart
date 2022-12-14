class VerifyPhoneModel {
  int status;
  String message;
  String code;

  VerifyPhoneModel(
      {required this.status, required this.message, required this.code});

  factory VerifyPhoneModel.fromJson(Map<String, dynamic> json) =>
      VerifyPhoneModel(
          status: json["status"], message: json["message"], code: json["code"]);
}

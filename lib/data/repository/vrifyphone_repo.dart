import 'package:electronicsstrore/data/API/verifyphone_api.dart';
import 'package:electronicsstrore/data/models/verifyphone_model.dart';

class AuthRepositery {
  final Auth auth;

  AuthRepositery(this.auth);
  Future<VerifyPhoneModel> verifyPhone(
      {required String name, required String phone}) async {
    final data = await auth.verifyPhone(name: name, phone: phone);
    return VerifyPhoneModel.fromJson(data);
  }
}

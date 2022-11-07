import 'package:electronicsstrore/data/models/verifyphone_model.dart';
import 'package:electronicsstrore/helper/remote/network_helper.dart';
import 'package:electronicsstrore/utilities/constants.dart';

class Auth {
  Future<Map<String, dynamic>> verifyPhone(
      {required String name, required String phone}) async {
    Map<String, dynamic> response = await NetworkProvider()
        .post(url: verifyPhoneEndPoint, body: {"name": name, "phone": phone});
    return response;
  }
}

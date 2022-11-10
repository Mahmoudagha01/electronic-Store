import '../../helper/remote/network_helper.dart';
import '../../utilities/constants.dart';

class OtpAuth {
  Future<Map<String, dynamic>> verifyOtp(
      { required String phone, required String code,}) async {
    Map<String, dynamic> response = await NetworkProvider().post(
        url: "$baseUrl$otpEndPoint",
        body: {"phone": phone,"code":code});
    return response;
  }
}

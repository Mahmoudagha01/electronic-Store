import 'package:electronicsstrore/data/API/verifyotp_api.dart';
import 'package:electronicsstrore/data/models/verifyotp_model.dart';

class OtpRepository {
  final OtpAuth otpAuth;

  OtpRepository(this.otpAuth);
  Future<OtpModel> otpVerify({required String phone, required String code}) async{
    final data = await otpAuth.verifyOtp(phone: phone, code: code);
    return OtpModel.fromJson(data);
  }
}

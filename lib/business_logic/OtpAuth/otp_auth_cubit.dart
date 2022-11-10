// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:electronicsstrore/data/repository/verifyotp_repo.dart';

import '../../data/models/verifyotp_model.dart';

part 'otp_auth_state.dart';

class OtpAuthCubit extends Cubit<OtpAuthState> {
  OtpAuthCubit(
    this.otpRepository,
  ) : super(OtpAuthInitial());

  final OtpRepository otpRepository;
  OtpModel? otpModelData;

  Future<OtpModel?> verifyOTP(
      {required String phone, required String code}) async {
    try {
      emit(OtpAuthLoading());
      otpModelData = await otpRepository.otpVerify(phone: phone, code: code);
      emit(OtpAuthsuccess(otpModelData!));
    } catch (e) {
      emit(OtpAuthError(otpModelData!.message));
    }
    return otpModelData;
  }
}

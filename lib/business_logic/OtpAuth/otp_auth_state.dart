part of 'otp_auth_cubit.dart';

@immutable
abstract class OtpAuthState {}

class OtpAuthInitial extends OtpAuthState {}

class OtpAuthLoading extends OtpAuthState {}

class OtpAuthsuccess extends OtpAuthState {
  final OtpModel data;

  OtpAuthsuccess(this.data);
}

class OtpAuthError extends OtpAuthState {
  final String message;

  OtpAuthError(this.message);
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthLoaded extends AuthState {
  final VerifyPhoneModel data;
  AuthLoaded({
    required this.data,
  });
}

class AuthError extends AuthState {
  final String message;

  AuthError(this.message);
}

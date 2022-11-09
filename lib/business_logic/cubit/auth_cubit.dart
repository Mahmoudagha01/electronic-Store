import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:electronicsstrore/data/models/verifyphone_model.dart';
import 'package:electronicsstrore/data/repository/vrifyphone_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(
    this.authRepositery,
  ) : super(AuthInitial());

  VerifyPhoneModel? verifyPhoneModel;
  final AuthRepositery authRepositery;

  Future verifyPhone({required String name, required String phone}) async {
    try {
      emit(AuthLoading());
      verifyPhoneModel =
          await authRepositery.verifyPhone(name: name, phone: phone);
      emit(AuthLoaded(data: verifyPhoneModel!));
    } catch (e) {
      emit(AuthError(verifyPhoneModel!.message));
    }
    return verifyPhoneModel;
  }
}

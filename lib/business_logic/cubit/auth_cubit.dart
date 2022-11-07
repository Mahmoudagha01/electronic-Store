// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
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

  Future<VerifyPhoneModel?> verifyPhone(
      {required String name, required String phone}) async {
    try {
      emit(AuthLoading());
      verifyPhoneModel =
          await authRepositery.verifyPhone(name: name, phone: phone);
      emit(AuthLoaded());
    
    } catch (e) {
      emit(AuthError());
    }
  
    return verifyPhoneModel;
  }
}

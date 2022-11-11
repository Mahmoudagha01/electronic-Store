// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:electronicsstrore/data/repository/gethelp_repo.dart';

import '../../data/models/help_model.dart';

part 'help_state.dart';

class HelpCubit extends Cubit<HelpState> {
  HelpCubit(
    this.helpRepository,
  ) : super(HelpInitial());

  final HelpRepository helpRepository;
  HelpModel? helpModeldata;

  Future<HelpModel?> getHelp() async {
    try {
      emit(HelpLoading());
      helpModeldata = await helpRepository.getHelp();
      emit(HelpLoaded(helpModeldata!));
    } catch (e) {
      emit(HelpError(message: helpModeldata!.message));
    }
    return helpModeldata;
  }
}

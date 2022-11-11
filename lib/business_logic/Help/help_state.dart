// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'help_cubit.dart';

@immutable
abstract class HelpState {}

class HelpInitial extends HelpState {}

class HelpLoading extends HelpState {}

class HelpLoaded extends HelpState {
  final HelpModel data;

  HelpLoaded(this.data);
}

class HelpError extends HelpState {
  final String message;
  HelpError({
    required this.message,
  });
}

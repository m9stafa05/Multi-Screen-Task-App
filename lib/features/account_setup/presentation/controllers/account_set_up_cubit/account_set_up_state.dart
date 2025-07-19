part of 'account_set_up_cubit.dart';

@immutable
sealed class AccountSetUpState {}

final class AccountSetUpInitial extends AccountSetUpState {}

final class AccountSetUpSaving extends AccountSetUpState {}

final class AccountSetUpSaved extends AccountSetUpState {}

final class AccountSetUpFailed extends AccountSetUpState {
  final String errorMessage;

  AccountSetUpFailed({required this.errorMessage});
}

final class AccountSetUpImageSelected extends AccountSetUpState {}

final class AccountSetUpImageRemoved extends AccountSetUpState {}

final class AccountSetUpGenderChanged extends AccountSetUpState {}

part of 'validate_cubit.dart';

@immutable
sealed class ValidateState {}

final class UserDataInitial extends ValidateState {}

final class UserDataFounded extends ValidateState {}

final class UserDataFailed extends ValidateState {}

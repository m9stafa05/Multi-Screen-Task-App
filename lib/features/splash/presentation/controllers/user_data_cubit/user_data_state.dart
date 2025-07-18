part of 'user_data_cubit.dart';

@immutable
sealed class UserDataState {}

final class UserDataInitial extends UserDataState {}

final class UserDataFounded extends UserDataState {}

final class UserDataFailed extends UserDataState {}

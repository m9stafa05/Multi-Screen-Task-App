part of 'user_info_cubit.dart';

@immutable
sealed class UserInfoState {}

final class UserInfoInitial extends UserInfoState {}

final class UserInfoLoading extends UserInfoState {}

final class UserInfoLoaded extends UserInfoState {
  final UserModel user;
  UserInfoLoaded(this.user);
}

final class UserInfoFailed extends UserInfoState {
  final String message;
  UserInfoFailed(this.message);
}

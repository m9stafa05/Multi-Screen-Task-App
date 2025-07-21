import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:multi_screen_task_app/core/models/user_model.dart';
import 'package:multi_screen_task_app/core/utils/shared_pref.dart';

part 'user_info_state.dart';

class UserInfoCubit extends Cubit<UserInfoState> {
  UserModel? user;
  UserInfoCubit() : super(UserInfoInitial()) {
    loadUser();
  }

  Future<void> loadUser() async {
    emit(UserInfoLoading());
    try {
      user = await UserPreferences.loadUser();
      if (user == null) {
        emit(UserInfoFailed("No user data found."));
      } else {
        emit(UserInfoLoaded(user!));
      }
    } catch (e) {
      emit(UserInfoFailed("Failed to load user: $e"));
    }
  }

  Future<void> saveUser() async {
    if (user != null) {
      await UserPreferences.saveUser(user: user!);
      emit(UserInfoLoaded(user!)); // Re-emit with updated data
    }
  }

  // Call from TaskCubit
  void incrementUnComplete() {
    if (user != null) {
      user = user!.copyWith(
        unCompleteCount: user!.unCompleteCount + 1,
      );
      saveUser();
    }
  }

  void toggleTaskScore(bool isNowCompleted) {
    if (user != null) {
      user = user!.copyWith(
        completeCount:
            (user!.completeCount + (isNowCompleted ? 1 : -1))
                .clamp(0, double.infinity)
                .toInt(),
        unCompleteCount:
            (user!.unCompleteCount + (isNowCompleted ? -1 : 1))
                .clamp(0, double.infinity)
                .toInt(),
      );

      saveUser();
    }
  }
}

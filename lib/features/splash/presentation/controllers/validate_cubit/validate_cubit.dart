import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';

import 'package:multi_screen_task_app/core/utils/shared_pref.dart';

part 'validate_state.dart';

class ValidateCubit extends Cubit<ValidateState> {
  ValidateCubit() : super(UserDataInitial());

  Future<void> checkUserData() async {
    try {
      final loggedIn = await UserPreferences.isLoggedIn();

      if (loggedIn) {
        emit(UserDataFounded());
      } else {
        emit(UserDataInitial());
      }
    } catch (e) {
      emit(UserDataFailed());
    }
  }
}

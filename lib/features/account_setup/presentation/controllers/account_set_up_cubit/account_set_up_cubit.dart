import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:multi_screen_task_app/core/models/user_model.dart';
import 'package:multi_screen_task_app/core/utils/shared_pref.dart';

part 'account_set_up_state.dart';

class AccountSetUpCubit extends Cubit<AccountSetUpState> {
  AccountSetUpCubit() : super(AccountSetUpInitial());
  File? profileImage;
  final ImagePicker _picker = ImagePicker();
  String? gender;

  void setGender(String? value) {
    gender = value;
    emit(AccountSetUpGenderChanged());
  }

  Future<void> pickImage() async {
    final pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 75,
    );

    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      emit(AccountSetUpImageSelected());
    }
  }

  void removeImage() {
    profileImage = null;
    emit(AccountSetUpImageRemoved());
  }

  Future<void> saveUserData({
    required String firstName,
    required String lastName,
    required String gender,
  }) async {
    try {
      emit(AccountSetUpSaving());

      final user = UserModel(
        firstName: firstName,
        lastName: lastName,
        gender: gender,
        image: profileImage?.path,
      );

      await UserPreferences.saveUser(user: user);

      emit(AccountSetUpSaved());
    } catch (e) {
      emit(AccountSetUpFailed(errorMessage: 'error occurs $e'));
    }
  }
}

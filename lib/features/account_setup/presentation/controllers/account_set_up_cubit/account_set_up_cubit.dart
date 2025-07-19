import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:multi_screen_task_app/core/utils/models/user_model.dart';
import 'package:multi_screen_task_app/core/utils/shared_pref.dart';

part 'account_set_up_state.dart';

class AccountSetUpCubit extends Cubit<AccountSetUpState> {
AccountSetUpCubit() : super(AccountSetUpInitial());

  File? profileImage;

  final ImagePicker _picker = ImagePicker();

  // ✅ اختيار صورة
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

  // ✅ إزالة الصورة
  void removeImage() {
    profileImage = null;
    emit(AccountSetUpImageRemoved());
  }

  // ✅ حفظ البيانات
  Future<void> saveUserData({
    required String firstName,
    required String lastName,
    required String gender,
  }) async {
    try {
      emit(AccountSetUpSaving());

      final imageBytes = profileImage != null
          ? await profileImage!.readAsBytes()
          : (await rootBundle.load(
              'assets/profile.png',
            )).buffer.asUint8List();

      final imageBase64 = base64Encode(imageBytes);

      final user = UserModel(
        firstName: firstName,
        lastName: lastName,
        gender: gender,
        image: imageBase64,
      );

      await UserPreferences.saveUser(user: user);

      emit(AccountSetUpSaved());
    } catch (e) {
      emit(AccountSetUpFailed(errorMessage: 'error occurs $e'));
    }
  }
}

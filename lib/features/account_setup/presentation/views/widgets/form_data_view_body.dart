import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_screen_task_app/features/account_setup/presentation/views/widgets/account_set_up_form.dart';
import 'package:multi_screen_task_app/features/account_setup/presentation/views/widgets/custom_form_text_field.dart';

class FormDataViewBody extends StatelessWidget {
  const FormDataViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: AccountSetUpForm()
    );
  }
}


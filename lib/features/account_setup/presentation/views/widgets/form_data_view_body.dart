import 'package:flutter/material.dart';
import 'package:multi_screen_task_app/features/account_setup/presentation/views/widgets/account_set_up_form.dart';

class FormDataViewBody extends StatelessWidget {
  const FormDataViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: AccountSetUpForm(),
    );
  }
}

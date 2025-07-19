import 'package:flutter/material.dart';
import 'package:multi_screen_task_app/features/account_setup/presentation/views/widgets/form_data_view_body.dart';

class FormDataView extends StatelessWidget {
  const FormDataView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:FormDataViewBody() ,
    );
  }
}
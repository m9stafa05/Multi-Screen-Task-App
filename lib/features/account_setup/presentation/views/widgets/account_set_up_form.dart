import 'package:flutter/material.dart';
import 'package:multi_screen_task_app/features/account_setup/presentation/views/widgets/custom_button.dart';
import 'package:multi_screen_task_app/features/account_setup/presentation/views/widgets/custom_form_text_field.dart';
import 'package:multi_screen_task_app/features/account_setup/presentation/views/widgets/gender_drop_down.dart';
import 'package:multi_screen_task_app/features/account_setup/presentation/views/widgets/profile_image_picer.dart';

class AccountSetUpForm extends StatefulWidget {
  const AccountSetUpForm({super.key});

  @override
  State<AccountSetUpForm> createState() => _AccountSetUpFormState();
}

class _AccountSetUpFormState extends State<AccountSetUpForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController firstNameController =
      TextEditingController();

  final TextEditingController lastNameController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        children: [
          const SizedBox(height: 16),
          const Text(
            textAlign: TextAlign.center,
            'Set Up Your Account',
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
          const SizedBox(height: 16),
          // First Name
          CustomFormTextField(
            controller: firstNameController,
            labelText: 'First Name',
          ),
          const SizedBox(height: 16),

          // Last Name
          CustomFormTextField(
            controller: lastNameController,
            labelText: 'Last Name',
          ),
          const SizedBox(height: 16),

          // Gender Dropdown
          const GenderDropdown(),

          const SizedBox(height: 16),

          // Optional Image ()
          const ProfileImagePicker(),

          const SizedBox(height: 24),

          // Submit Button
          CustomButton(text: 'Finish', onPressed: () {}),
        ],
      ),
    );
  }
}

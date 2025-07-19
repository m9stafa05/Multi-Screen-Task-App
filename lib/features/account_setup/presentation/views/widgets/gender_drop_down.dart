import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_screen_task_app/features/account_setup/presentation/controllers/account_set_up_cubit/account_set_up_cubit.dart';

class GenderDropdown extends StatelessWidget {
  const GenderDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<AccountSetUpCubit>();
    final selectedGender = cubit.gender;

    return DropdownButtonFormField<String>(
      value: selectedGender,
      decoration: const InputDecoration(
        labelText: 'Gender',
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.person_2),
      ),
      items: const [
        DropdownMenuItem(value: 'Male', child: Text('Male')),
        DropdownMenuItem(value: 'Female', child: Text('Female')),
        DropdownMenuItem(value: 'Other', child: Text('Other')),
      ],
      onChanged: context.read<AccountSetUpCubit>().setGender,
      validator: (value) => value == null || value.isEmpty
          ? 'Please select gender'
          : null,
    );
  }
}

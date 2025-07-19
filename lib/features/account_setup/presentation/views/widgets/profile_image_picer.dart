import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_screen_task_app/features/account_setup/presentation/controllers/account_set_up_cubit/account_set_up_cubit.dart';

class ProfileImagePicker extends StatelessWidget {
  const ProfileImagePicker({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<AccountSetUpCubit>();
    final File? profileImage = cubit.profileImage;

    return Center(
      child: Column(
        children: [
          profileImage != null
              ? CircleAvatar(
                  radius: 60,
                  backgroundImage: FileImage(profileImage),
                )
              : const CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('assets/profile.png'),
                ),

          const SizedBox(height: 10),

          TextButton.icon(
            onPressed: () {
              context.read<AccountSetUpCubit>().pickImage();
            },
            icon: const Icon(Icons.image),
            label: const Text('Choose Profile Image'),
          ),

          if (profileImage != null)
            TextButton(
              onPressed: () => cubit.removeImage(),
              child: const Text('Remove Image'),
            ),
        ],
      ),
    );
  }
}

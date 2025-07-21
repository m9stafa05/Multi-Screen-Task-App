import 'dart:io';
import 'package:flutter/material.dart';
import 'package:multi_screen_task_app/core/models/user_model.dart';

class ProfileInfoSection extends StatelessWidget {
  const ProfileInfoSection({super.key, required this.user});

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 60),
        CircleAvatar(
          radius: 60,
          backgroundImage:
              File(user.image ?? 'assets/profile.png').existsSync()
              ? FileImage(File(user.image!))
              : const AssetImage('assets/profile.png')
                    as ImageProvider,
        ),

        const SizedBox(height: 30),
        Card(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: ListTile(
            leading: const Icon(Icons.near_me),
            title: Text(
              '${user.firstName.toUpperCase()} ${user.lastName.toUpperCase()}',
            ),
          ),
        ),

        const SizedBox(height: 20),
        Card(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: ListTile(
            leading: const Icon(Icons.person),
            title: Text(user.gender),
          ),
        ),
      ],
    );
  }
}

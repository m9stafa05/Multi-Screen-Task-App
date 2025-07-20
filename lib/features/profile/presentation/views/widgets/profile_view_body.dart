import 'dart:io';

import 'package:flutter/material.dart';
import 'package:multi_screen_task_app/core/utils/shared_pref.dart';

class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({super.key});

  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody> {
  String? userImage;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final user = await UserPreferences.loadUser();
    if (user != null) {
      setState(() {
        userImage = user.image;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Column(
  children: [
    ProfileInfoImage(
      userImage: userImage ?? 'assets/profile.png',
    ),
  ],
);
  }
}

class ProfileInfoImage extends StatelessWidget {
  const ProfileInfoImage({super.key, required this.userImage});
  final String userImage;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 150,
          height: 150,
          child: CircleAvatar(
            radius: 60,
            backgroundImage:
                userImage != null && File(userImage!).existsSync()
                ? FileImage(File(userImage!))
                : const AssetImage('assets/profile.png')
                      as ImageProvider,
          ),
        ),
      ],
    );
  }
}

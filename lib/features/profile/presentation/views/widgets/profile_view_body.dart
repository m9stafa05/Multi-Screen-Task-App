import 'package:flutter/material.dart';
import 'package:multi_screen_task_app/core/utils/shared_pref.dart';
import 'package:multi_screen_task_app/features/profile/presentation/views/widgets/profile_info_image.dart';

class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({super.key});

  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody> {
  String? userImage;
  String? userName;

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
        userName = '${user.firstName} ${user.lastName}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileInfoImage(
          userImage: userImage ?? 'assets/profile.png',
          userName: userName ?? '',
        ),
      ],
    );
  }
}

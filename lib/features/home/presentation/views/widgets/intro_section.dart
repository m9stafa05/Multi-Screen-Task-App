import 'package:flutter/material.dart';
import 'package:multi_screen_task_app/core/utils/shared_pref.dart';
import 'package:multi_screen_task_app/features/home/presentation/views/widgets/loaded_image.dart';

class IntroSection extends StatefulWidget {
  const IntroSection({super.key});

  @override
  State<IntroSection> createState() => _IntroSectionState();
}

class _IntroSectionState extends State<IntroSection> {
  String? userName;
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
        userName = user.firstName;
        userImage = user.image;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Welcome', style: TextStyle(fontSize: 20)),
          Text(
            userName != null
                ? '$userName'.toUpperCase()
                : 'Loading...',
            style: const TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30),
          LoadedImage(userImage: userImage),
        ],
      ),
    );
  }
}

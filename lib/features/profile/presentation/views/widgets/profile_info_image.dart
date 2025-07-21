import 'dart:io';
import 'package:flutter/material.dart';
import 'package:multi_screen_task_app/features/profile/presentation/views/widgets/task_score.dart';

class ProfileInfoImage extends StatelessWidget {
  const ProfileInfoImage({
    super.key,
    required this.userImage,
    required this.userName,
  });

  final String userImage;
  final String userName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 60),
        CircleAvatar(
          radius: 60,
          backgroundImage: File(userImage).existsSync()
              ? FileImage(File(userImage))
              : const AssetImage('assets/profile.png')
                    as ImageProvider,
        ),
        const SizedBox(height: 20),
        Text(
          userName.toUpperCase(),
          style: const TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 100.0),
          child: Divider(color: Colors.grey, thickness: 2),
        ),

        const SizedBox(height: 20),

        /// 👤 بيانات المستخدم (اسم + عمر)
        Card(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: ListTile(
            leading: const Icon(Icons.person),
            title: Text(userName),
            subtitle: const Text('Age: 24'),
          ),
        ),

        const SizedBox(height: 20),
        const Card(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: ListTile(
            leading: Icon(Icons.cake),
            title: Text('Age: 24'),
          ),
        ),
        const SizedBox(height: 30),
        const TasksScore(doneTasks: 1, unfinishedTasks: 2),
        const SizedBox(height: 30),
      ],
    );
  }
}

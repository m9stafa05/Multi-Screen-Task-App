import 'dart:io';

import 'package:flutter/material.dart';

class LoadedImage extends StatelessWidget {
  const LoadedImage({super.key, required this.userImage});

  final String? userImage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 300,
      child: CircleAvatar(
        radius: 60,
        backgroundImage:
            userImage != null && File(userImage!).existsSync()
            ? FileImage(File(userImage!))
            : const AssetImage('assets/profile.png') as ImageProvider,
      ),
    );
  }
}

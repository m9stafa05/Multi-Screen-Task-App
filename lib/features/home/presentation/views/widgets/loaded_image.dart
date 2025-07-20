import 'dart:io';

import 'package:flutter/material.dart';

class LoadedImage extends StatelessWidget {
  const LoadedImage({super.key, required this.userImage});

  final String? userImage;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 60,
      backgroundImage:
          userImage != null && File(userImage!).existsSync()
          ? FileImage(File(userImage!))
          : const AssetImage('assets/profile.png') as ImageProvider,
    );
  }
}

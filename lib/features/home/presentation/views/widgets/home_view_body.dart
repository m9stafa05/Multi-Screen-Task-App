import 'package:flutter/material.dart';
import 'package:multi_screen_task_app/features/home/presentation/views/widgets/custom_app_bar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(children: [CustomAppBar(), IntroSection()]);
  }
}

class IntroSection extends StatelessWidget {
  const IntroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Welocome'));
  }
}



import 'package:flutter/material.dart';
import 'package:multi_screen_task_app/features/home/presentation/views/widgets/custom_drawer.dart';
import 'package:multi_screen_task_app/features/home/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      drawer: CustomDrawer(),
      body: HomeViewBody(),
    );
  }
}

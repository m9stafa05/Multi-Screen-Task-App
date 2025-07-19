import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:multi_screen_task_app/core/utils/app_router.dart';
import 'package:multi_screen_task_app/core/widgets/custom_bottom_navigation_bar.dart';
import 'package:multi_screen_task_app/features/home/presentation/views/widgets/custom_drawer.dart';

class MainScaffold extends StatelessWidget {
  final Widget child;

  const MainScaffold({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final currentLocation = GoRouter.of(
      context,
    ).routeInformationProvider.value.uri.toString();

    int selectedIndex = 0;
    if (currentLocation.startsWith(AppRouter.kTaskView)) {
      selectedIndex = 1;
    } else if (currentLocation.startsWith(AppRouter.kProfileView)) {
      selectedIndex = 2;
    }
    return Scaffold(
      body: child,
      drawer: const CustomDrawer(),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: selectedIndex,
      ),
    );
  }
}

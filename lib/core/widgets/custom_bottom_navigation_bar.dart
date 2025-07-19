import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:multi_screen_task_app/core/utils/app_router.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key, required this.currentIndex});
  final int currentIndex;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex, // must be set to avoid errors
      onTap: (index) {
        switch (index) {
          case 0:
            context.go(AppRouter.kHomeView);
            break;
          case 1:
            context.go(AppRouter.kTaskView);
            break;
          case 2:
            context.go(AppRouter.kProfileView);
            break;
        }
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.task),
          label: 'Tasks',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  }
}

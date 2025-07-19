import 'package:flutter/material.dart';
import 'package:multi_screen_task_app/core/utils/app_router.dart';
import 'package:multi_screen_task_app/core/utils/functions/views_navigation.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const DrawerHeader(
            child: Text(
              'Menu',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              navigateIfNeeded(context, AppRouter.kHomeView);
            },
          ),
          ListTile(
            leading: const Icon(Icons.task),
            title: const Text('Tasks'),
            onTap: () {
              navigateIfNeeded(context, AppRouter.kTaskView);
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            onTap: () {
              navigateIfNeeded(context, AppRouter.kProfileView);
            },
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:multi_screen_task_app/core/utils/app_router.dart';
import 'package:multi_screen_task_app/features/account_setup/presentation/views/widgets/starter_button.dart';

class AccountSetupViewBody extends StatelessWidget {
  const AccountSetupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.account_circle,
            size: 80,
            color: Colors.blueAccent,
          ),
          const SizedBox(height: 20),
          const Text(
            "Set Up Your Account",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 20),
          StarterButton(
            onPressed: () {
              GoRouter.of(context).go(AppRouter.kFormDataView);
            },
          ),
        ],
      ),
    );
  }
}

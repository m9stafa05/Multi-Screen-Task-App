import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:multi_screen_task_app/core/utils/app_router.dart';
import 'package:multi_screen_task_app/features/account_setup/presentation/views/widgets/set_up_button.dart';

class AccountSetupViewBody extends StatelessWidget {
  const AccountSetupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SetUpButton(
        onPressed: () {
          GoRouter.of(context).go(AppRouter.kFormDataView);
        },
      ),
    );
  }
}

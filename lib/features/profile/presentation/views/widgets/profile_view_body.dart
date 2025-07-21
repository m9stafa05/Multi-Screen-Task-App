import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:multi_screen_task_app/core/controllers/cubit/user_info_cubit.dart';
import 'package:multi_screen_task_app/core/utils/app_router.dart';
import 'package:multi_screen_task_app/core/utils/shared_pref.dart';
import 'package:multi_screen_task_app/features/profile/presentation/views/widgets/profile_info_image.dart';
import 'package:multi_screen_task_app/features/profile/presentation/views/widgets/task_score.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<UserInfoCubit, UserInfoState>(
          builder: (context, state) {
            if (state is UserInfoLoaded) {
              final userInfo = state.user;
              return Column(
                children: [
                  ProfileInfoSection(user: userInfo),
                  const SizedBox(height: 60),
                  TasksScore(userModel: userInfo),
                  const SizedBox(height: 180),
                  ElevatedButton(
                    onPressed: () {
                      UserPreferences.logout();
                      GoRouter.of(context).go(AppRouter.kSplashView);
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text('Delete Account'),
                  ),
                ],
              );
            } else if (state is UserInfoFailed) {
              return const SnackBar(
                content: Text('Failed to load user info'),
              );
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_screen_task_app/core/controllers/cubit/user_info_cubit.dart';
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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_screen_task_app/core/controllers/cubit/user_info_cubit.dart';
import 'package:multi_screen_task_app/features/home/presentation/views/widgets/loaded_image.dart';

class IntroSection extends StatelessWidget {
  const IntroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<UserInfoCubit, UserInfoState>(
        builder: (context, state) {
          if (state is UserInfoLoaded) {
            final userInfo = state.user;
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Welcome', style: TextStyle(fontSize: 20)),
                Text(
                  userInfo.firstName.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),
                LoadedImage(userImage: userInfo.image),
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
    );
  }
}

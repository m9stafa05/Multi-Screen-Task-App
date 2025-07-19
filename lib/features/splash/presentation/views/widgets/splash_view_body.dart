import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:multi_screen_task_app/core/utils/app_router.dart';
import 'package:multi_screen_task_app/features/splash/presentation/controllers/validate_cubit/validate_cubit.dart';
import 'package:multi_screen_task_app/features/splash/presentation/views/widgets/splash_animate.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  double _opacity = 0.0;
  late AnimationController animationController;
  late Animation<Offset> slideAnimation;

  @override
  void initState() {
    super.initState();
    initSlidingAnimationMethod();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ValidateCubit>().checkUserData();
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ValidateCubit, ValidateState>(
      listener: (context, state) async {
        if (state is UserDataFounded) {
          await Future.delayed(const Duration(seconds: 4));
          // ignore: use_build_context_synchronously
          GoRouter.of(context).go(AppRouter.kHomeView);
        } else if (state is UserDataInitial) {
          await Future.delayed(const Duration(seconds: 4));
          // ignore: use_build_context_synchronously
          GoRouter.of(context).go(AppRouter.kAccountSetup);
        } else if (state is UserDataFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Error loading user data")),
          );
        }
      },
      child: SplashAnimate(
        opacity: _opacity,
        slideAnimation: slideAnimation,
      ),
    );
  }

  void initSlidingAnimationMethod() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    slideAnimation =
        Tween<Offset>(
          begin: const Offset(0, 3), // From bottom
          end: Offset.zero,
        ).animate(
          CurvedAnimation(
            parent: animationController,
            curve: Curves.elasticOut, // Smooth bounce effect
          ),
        );

    animationController.forward();
    // Start fade animation shortly after
    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        _opacity = 1.0;
      });
    });
  }
}

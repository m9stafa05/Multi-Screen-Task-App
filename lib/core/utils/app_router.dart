import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:multi_screen_task_app/features/account_setup/presentation/views/account_setup_view.dart';
import 'package:multi_screen_task_app/features/home/presentation/views/home_view.dart';
import 'package:multi_screen_task_app/features/splash/presentation/controllers/user_data_cubit/user_data_cubit.dart';
import 'package:multi_screen_task_app/features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const String kHomeView = '/home_view';
  static const String kAccountSetup = '/account_setup_view';
  static GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => BlocProvider(
          create: (context) => UserDataCubit(),
          child: const SplashView(),
        ),
      ),
      GoRoute(
        path: kAccountSetup,
        builder: (context, state) => const AccountSetupView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
    ],
  );
}

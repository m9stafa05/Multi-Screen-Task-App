import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:multi_screen_task_app/core/widgets/main_scaffold.dart';
import 'package:multi_screen_task_app/features/account_setup/presentation/controllers/account_set_up_cubit/account_set_up_cubit.dart';
import 'package:multi_screen_task_app/features/account_setup/presentation/views/account_setup_view.dart';
import 'package:multi_screen_task_app/features/account_setup/presentation/views/form_data_view.dart';
import 'package:multi_screen_task_app/features/home/presentation/views/home_view.dart';
import 'package:multi_screen_task_app/features/profile/presentation/views/profile_view.dart';
import 'package:multi_screen_task_app/features/splash/presentation/controllers/validate_cubit/validate_cubit.dart';
import 'package:multi_screen_task_app/features/splash/presentation/views/splash_view.dart';
import 'package:multi_screen_task_app/features/tasks/presentation/views/task_view.dart';

abstract class AppRouter {
  static const String kHomeView = '/home_view';
  static const String kAccountSetup = '/account_setup_view';
  static const String kFormDataView = '/form_data_view';
  static const String kTaskView = '/task_view';
  static const String kProfileView = '/profile_view';
  static GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => BlocProvider(
          create: (context) => ValidateCubit(),
          child: const SplashView(),
        ),
      ),
      GoRoute(
        path: kAccountSetup,
        builder: (context, state) => const AccountSetupView(),
      ),
      GoRoute(
        path: kFormDataView,
        builder: (context, state) => BlocProvider(
          create: (context) => AccountSetUpCubit(),
          child: const FormDataView(),
        ),
      ),
      ShellRoute(
        builder: (context, state, child) {
          return MainScaffold(child: child);
        },
        routes: [
          GoRoute(
            path: AppRouter.kHomeView,
            builder: (context, state) => const HomeView(),
          ),
          GoRoute(
            path: AppRouter.kTaskView,
            builder: (context, state) => const TaskView(),
          ),
          GoRoute(
            path: AppRouter.kProfileView,
            builder: (context, state) => const ProfileView(),
          ),
        ],
      ),
    ],
  );
}

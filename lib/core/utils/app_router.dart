import 'package:go_router/go_router.dart';
import 'package:multi_screen_task_app/features/home/presentation/views/home_view.dart';
import 'package:multi_screen_task_app/features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const String kHomeView = '/home_view';
  static GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
    ],
  );
}

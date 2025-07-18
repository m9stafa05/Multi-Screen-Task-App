import 'package:flutter/material.dart';
import 'package:multi_screen_task_app/core/utils/app_router.dart';

void main() {
  runApp(const MultiScreenTaskApp());
}

class MultiScreenTaskApp extends StatelessWidget {
  const MultiScreenTaskApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData.dark(),
      routerConfig: AppRouter.router,
    );
  }
}

/*
lib/
└── features/
    └── home/
        ├──
        │
        ├── data/
        │   ├── models/          # DTOs (from/to JSON)
        │   └── repositories/    # Implements domain repos, uses services/API
        │
        └── presentation/
            ├── controllers/     # ViewModels (state, methods, DI)
            ├── views/           # Screens (home_view.dart, etc.)
            └── widgets/         # UI components (task_card.dart, etc.)
 */

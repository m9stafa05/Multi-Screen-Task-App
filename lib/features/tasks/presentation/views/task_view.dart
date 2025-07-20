import 'package:flutter/material.dart';
import 'package:multi_screen_task_app/features/tasks/presentation/views/widgets/task_view_body.dart';

class TaskView extends StatelessWidget {
  const TaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: TaskViewBody());
  }
}

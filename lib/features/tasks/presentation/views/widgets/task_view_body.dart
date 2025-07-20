import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_screen_task_app/features/tasks/presentation/controllers/task_cubit/task_cubit.dart';
import 'package:multi_screen_task_app/features/tasks/presentation/views/widgets/add_task_field.dart';
import 'package:multi_screen_task_app/features/tasks/presentation/views/widgets/task_list_view.dart';

class TaskViewBody extends StatefulWidget {
  const TaskViewBody({super.key});

  @override
  State<TaskViewBody> createState() => _TaskViewBodyState();
}

class _TaskViewBodyState extends State<TaskViewBody>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  final TextEditingController _taskController =
      TextEditingController();

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _taskController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: BlocBuilder<TaskCubit, TaskState>(
        builder: (context, state) {
          final cubit = context.read<TaskCubit>();
          final incompleteTasks = cubit.incompleteTasks;
          final completedTasks = cubit.completedTasks;

          return SafeArea(
            child: Column(
              children: [
                // Input Field + Add Button
                AddTaskField(taskController: _taskController),
                const SizedBox(height: 16),

                // TabBar
                TabBar(
                  controller: _tabController,
                  tabs: const [
                    Tab(text: 'Tasks'),
                    Tab(text: 'Completed'),
                  ],
                  labelColor: const Color(0xFFAB0303),
                ),
                const SizedBox(height: 8),

                // Tab Views
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      TaskListView(taskList: incompleteTasks),
                      TaskListView(taskList: completedTasks),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

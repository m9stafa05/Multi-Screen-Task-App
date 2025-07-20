import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_screen_task_app/features/tasks/data/model/task_model.dart';
import 'package:multi_screen_task_app/features/tasks/presentation/controllers/task_cubit/task_cubit.dart';

class TaskActionsButtons extends StatelessWidget {
  const TaskActionsButtons({
    super.key,
    required this.task,
    required this.taskIndex,
  });

  final TaskModel task;
  final int taskIndex;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 110,
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              BlocProvider.of<TaskCubit>(context).toggleTask(task);
            },
            icon: Icon(
              task.isCompleted
                  ? Icons.check_circle
                  : Icons.radio_button_unchecked,
            ),
          ),
          const SizedBox(width: 5),
          IconButton(
            onPressed: () async {
              final confirm = await showDialog<bool>(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Delete Task'),
                  content: const Text(
                    'Are you sure you want to delete this task?',
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context, false),
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context, true),
                      child: const Text('Delete'),
                    ),
                  ],
                ),
              );
              if (confirm == true) {
                BlocProvider.of<TaskCubit>(
                  context,
                ).removeTask(taskIndex);
              }
            },
            icon: const Icon(Icons.delete, color: Colors.red),
          ),
        ],
      ),
    );
  }
}

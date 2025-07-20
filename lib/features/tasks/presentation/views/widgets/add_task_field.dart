import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_screen_task_app/features/tasks/presentation/controllers/task_cubit/task_cubit.dart';

class AddTaskField extends StatelessWidget {
  const AddTaskField({
    super.key,
    required TextEditingController taskController,
  }) : _taskController = taskController;

  final TextEditingController _taskController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _taskController,
            decoration:const InputDecoration(
              hintText: 'Enter a task',
              border: UnderlineInputBorder(),
            ),
            onSubmitted: (value) {
              if (value.trim().isNotEmpty) {
                BlocProvider.of<TaskCubit>(context).addTask(value);
                _taskController.clear();
              }
            },
          ),
        ),
        const SizedBox(width: 8),
        ElevatedButton(
          onPressed: () {
            final value = _taskController.text.trim();
            if (value.isNotEmpty) {
              BlocProvider.of<TaskCubit>(context).addTask(value);
              _taskController.clear();
            }
          },
          child: const Text('Add'),
        ),
      ],
    );
  }
}

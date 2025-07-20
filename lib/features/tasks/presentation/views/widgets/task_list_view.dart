import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_screen_task_app/features/tasks/data/model/task_model.dart';
import 'package:multi_screen_task_app/features/tasks/presentation/controllers/task_cubit/task_cubit.dart';

class TaskListView extends StatelessWidget {
  const TaskListView({super.key, required this.taskList});

  final List<TaskModel> taskList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: taskList.isEmpty
          ? const Center(child: Text('No tasks added yet.'))
          : ListView.builder(
              itemCount: taskList.length,
              itemBuilder: (context, index) {
                final task = taskList[index];
                return Card(
                  child: ListTile(
                    title: Text(task.title),
                    subtitle: Text(task.date.toString()),
                    trailing: IconButton(
                      onPressed: () {
                        BlocProvider.of<TaskCubit>(
                          context,
                        ).toggleTask(task);
                      },
                      icon: Icon(
                        task.isCompleted
                            ? Icons.check_circle
                            : Icons.radio_button_unchecked,
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}

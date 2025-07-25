import 'package:flutter/material.dart';
import 'package:multi_screen_task_app/core/utils/functions/calc_date_time.dart';
import 'package:multi_screen_task_app/features/tasks/data/model/task_model.dart';
import 'package:multi_screen_task_app/features/tasks/presentation/views/widgets/task_actions_button.dart';

class TaskListView extends StatelessWidget {
  const TaskListView({super.key, required this.taskList});

  final List<TaskModel> taskList;

  @override
  Widget build(BuildContext context) {
    return taskList.isEmpty
        ? const Center(child: Text('No tasks added yet.'))
        : ListView.builder(
            itemCount: taskList.length,
            itemBuilder: (context, index) {
              final task = taskList[index];
              return Card(
                child: ListTile(
                  title: Text(task.title),
                  subtitle: Text(formatSmart(task.date)),
                  trailing: TaskActionsButtons(
                    task: task,
                    taskIndex: index,
                  ),
                ),
              );
            },
          );
  }
}

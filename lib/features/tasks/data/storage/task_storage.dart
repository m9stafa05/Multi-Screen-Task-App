
import 'package:multi_screen_task_app/features/tasks/data/model/task_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TaskStorage {
  static const _tasksKey = 'tasks';

  /// Save list of tasks to SharedPreferences
  static Future<void> saveTasks(List<TaskModel> tasks) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList = tasks.map((task) => task.toJson()).toList();
    await prefs.setStringList(_tasksKey, jsonList);
  }

  /// Load list of tasks from SharedPreferences
  static Future<List<TaskModel>> loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList = prefs.getStringList(_tasksKey);
    if (jsonList == null) return [];
    return jsonList
        .map((jsonStr) => TaskModel.fromJson(jsonStr))
        .toList();
  }
}

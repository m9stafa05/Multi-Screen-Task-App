import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:multi_screen_task_app/features/tasks/data/model/task_model.dart';
import 'package:multi_screen_task_app/features/tasks/data/storage/task_storage.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  final List<TaskModel> tasks = [];
  TaskCubit() : super(TaskAdded(tasks: const [])) {
    loadTasks();
  }

  Future<void> loadTasks() async {
    final loadedTasks = await TaskStorage.loadTasks();
    tasks
      ..clear()
      ..addAll(loadedTasks);
    emit(TaskAdded(tasks: List.from(tasks)));
  }

  Future<void> saveTasks() async {
    await TaskStorage.saveTasks(tasks);
  }

  void addTask(String title) {
    tasks.add(TaskModel(title: title));
    emit(TaskAdded(tasks: List.from(tasks)));
    saveTasks();
  }

  void toggleTask(TaskModel task) {
    final index = tasks.indexOf(task);
    if (index != -1) {
      tasks[index] = task.copyWith(isCompleted: !task.isCompleted);
      emit(TaskAdded(tasks: List.from(tasks)));
      saveTasks();
    }
  }

  void removeTask(int index) {
    tasks.removeAt(index);
    emit(TaskAdded(tasks: List.from(tasks)));
    saveTasks();
  }

  List<TaskModel> get incompleteTasks =>
      tasks.where((task) => !task.isCompleted).toList();

  List<TaskModel> get completedTasks =>
      tasks.where((task) => task.isCompleted).toList();
}

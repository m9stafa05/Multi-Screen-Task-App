import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:multi_screen_task_app/features/tasks/data/model/task_model.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskInitial());
  final List<TaskModel> tasks = [];

  void addTask(String title) {
    tasks.add(TaskModel(title: title));
    emit(TaskAdded(tasks: List.from(tasks)));
  }

  void toggleTask(TaskModel task) {
    final index = tasks.indexOf(task);
    if (index != -1) {
      tasks[index] = task.copyWith(isCompleted: !task.isCompleted);
      emit(TaskAdded(tasks: List.from(tasks)));
    }
  }

  void removeTask(int index) {
    tasks.removeAt(index);
    emit(TaskAdded(tasks: List.from(tasks)));
  }

  List<TaskModel> get incompleteTasks =>
      tasks.where((task) => !task.isCompleted).toList();

  List<TaskModel> get completedTasks =>
      tasks.where((task) => task.isCompleted).toList();
}

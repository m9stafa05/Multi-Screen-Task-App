part of 'task_cubit.dart';

@immutable
sealed class TaskState {}

final class TaskInitial extends TaskState {}

final class TaskAdded extends TaskState {
  final List<TaskModel> tasks;

  TaskAdded({required this.tasks});
}



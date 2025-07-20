import 'package:multi_screen_task_app/core/utils/functions/calc_date_time.dart';

class TaskModel {
  final String title;
  final DateTime date;
  final bool isCompleted;

  TaskModel({
    required this.title,
    DateTime? date,
    this.isCompleted = false,
  }) : date = onlyDate(date ?? DateTime.now());

  TaskModel copyWith({
    String? title,
    DateTime? date,
    bool? isCompleted,
  }) {
    return TaskModel(
      title: title ?? this.title,
      isCompleted: isCompleted ?? this.isCompleted,
      date: date != null ? onlyDate(date) : this.date,
    );
  }
}

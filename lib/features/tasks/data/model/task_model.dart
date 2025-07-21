import 'dart:convert';

import 'package:multi_screen_task_app/core/utils/functions/calc_date_time.dart';

class TaskModel {
  final String title;
  final DateTime date;
  final bool isCompleted;

  TaskModel({
    required this.title,
    DateTime? date,
    this.isCompleted = false,
  }) : date = date ?? DateTime.now();

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

  // Convert TaskModel to Map<String, dynamic>
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'date': date.toIso8601String(),
      'isCompleted': isCompleted,
    };
  }

  // Create TaskModel from Map<String, dynamic>
  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      title: map['title'],
      date: DateTime.parse(map['date']),
      isCompleted: map['isCompleted'],
    );
  }

  // Convert TaskModel to JSON string
  String toJson() => json.encode(toMap());

  // Create TaskModel from JSON string
  factory TaskModel.fromJson(String source) =>
      TaskModel.fromMap(json.decode(source));
}

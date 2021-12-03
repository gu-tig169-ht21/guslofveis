import 'package:provider/provider.dart';
import 'dart:convert';

//Blueprint för Items - hur ser arkitekturen för ett Item ut
class TodoItem {
  final String id;
  String title;
  bool done;

  TodoItem({this.id = '', required this.title, this.done = false});

  void ifDone(item) {
    done = !done;
  }

  factory TodoItem.fromJson(Map<String, dynamic> json) => TodoItem(
    id: json['id'],
    title: json['title'],
    done: json['done'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'done': done,
  };
}
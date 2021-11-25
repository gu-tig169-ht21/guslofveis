import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:my_first_app/models/todoitem.dart';

class TodoFetcher {
  List<TodoItem> todoItem = [];

  static Future<List<TodoItem>> fetchTodo() async {
    http.Response response = await http.get(
      Uri.parse(
          'https://todoapp-api-pyq5q.ondigitalocean.app/todos?key=101d1770-e7fc-4eef-b12b-89b0810f2879'),
    );

    List<dynamic> parsedList = jsonDecode(response.body);
    List<TodoItem> todoItem =
        List<TodoItem>.from(parsedList.map((i) => TodoItem.fromJson(i)));
    return todoItem;
  }

  static Future<List<TodoItem>> addTodo(TodoItem item) async {
    http.Response response = await http.post(
      Uri.parse(
          'https://todoapp-api-pyq5q.ondigitalocean.app/todos?key=101d1770-e7fc-4eef-b12b-89b0810f2879'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(item),
    );

    List<dynamic> parsedList = jsonDecode(response.body);
    List<TodoItem> todoItem =
        List<TodoItem>.from(parsedList.map((i) => TodoItem.fromJson(i)));
    return todoItem;
  }

  static Future<List<TodoItem>> removeTodo(TodoItem item) async {
    http.Response response = await http.delete(
      Uri.parse(
          'https://todoapp-api-pyq5q.ondigitalocean.app/todos/${item.id}?key=101d1770-e7fc-4eef-b12b-89b0810f2879'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(item),
    );
    List<dynamic> parsedList = jsonDecode(response.body);
    List<TodoItem> todoItem =
        List<TodoItem>.from(parsedList.map((i) => TodoItem.fromJson(i)));
    return todoItem;
  }

  static Future<List<TodoItem>> updateTodo(TodoItem item) async {
    http.Response response = await http.put(
      Uri.parse(
          'https://todoapp-api-pyq5q.ondigitalocean.app/todos/${item.id}?key=101d1770-e7fc-4eef-b12b-89b0810f2879'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(item),
    );
    List<dynamic> parsedList = jsonDecode(response.body);
    List<TodoItem> todoItem =
        List<TodoItem>.from(parsedList.map((i) => TodoItem.fromJson(i)));
    return todoItem;
  }
}

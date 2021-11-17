import 'package:flutter/material.dart';
import 'package:my_first_app/models/todoitem.dart';
import 'package:provider/provider.dart';

class ListProvider with ChangeNotifier {
  List<TodoItem> todoitems = [];
  List<TodoItem> get list => todoitems;

  // Lägger till Todo-item i listan
  void add(TodoItem item) {
    todoitems.add(item);
    notifyListeners();
  }

  // Tar bort vald Todo-item från listan
  void remove(TodoItem item) {
    todoitems.remove(item);
    notifyListeners();
  }

  void todone(TodoItem item) {
    item.ifDone(item);
    notifyListeners();
  }
}
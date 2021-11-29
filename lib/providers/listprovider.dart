import 'package:flutter/material.dart';
import 'package:my_first_app/models/todoitem.dart';
import 'package:my_first_app/todofetcher.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ListProvider with ChangeNotifier {
  List<TodoItem> todoitems = [];
  List<TodoItem> get list => todoitems;
  String filterBy = 'all';

ListProvider() {
  fetch();
}

  //Hämta lista
  void fetch() async {
    todoitems = await TodoFetcher.fetchTodo();
    notifyListeners();
  }

  // Lägger till Todo-item i listan
  void add(TodoItem item) async {
    todoitems.add(item);
    todoitems = await TodoFetcher.addTodo(item);
    notifyListeners();
  }
  // Tar bort vald Todo-item från listan
  void remove(TodoItem item) async {
    todoitems.remove(item);
    todoitems = await TodoFetcher.removeTodo(item);
    notifyListeners();
  }

  void todone(TodoItem item) async {
    item.ifDone(item);
    todoitems = await TodoFetcher.updateTodo(item);
    notifyListeners();
  }

  void setFilterBy(String filterBy) {
    this.filterBy = filterBy;
    notifyListeners();
  }
}
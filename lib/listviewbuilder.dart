import 'package:flutter/material.dart';
import 'package:my_first_app/models/todoitem.dart';
import 'package:provider/provider.dart';
import 'package:my_first_app/providers/listprovider.dart';

import 'providers/listprovider.dart';

// UI för listan med checkbox, ikoner, text och textdekoration
class ListViewBuilder extends StatelessWidget {
  List<TodoItem> list = [];

  ListViewBuilder(this.list);

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return _listItem(list[index], context);
        });
  }

  Widget _listItem(TodoItem item, context) {
    return Container(
      margin: EdgeInsets.all(0),
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: ListTile(
          leading: Checkbox(value: item.done, onChanged: (value) {
            Provider.of<ListProvider>(context, listen: false).todone(item);
          }),
          title: Text(item.title, style: 
          TextStyle(
            fontSize: 23,
            decoration: item.done ? TextDecoration.lineThrough : null,
            )),
          trailing: IconButton(
            icon: const Icon(Icons.delete, size: 30.0),
            onPressed: () {
              Provider.of<ListProvider>(context, listen: false).remove(item);
            },
          ),
        ),
      ),
    );
  }
}

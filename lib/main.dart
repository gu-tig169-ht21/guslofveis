import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_first_app/listviewbuilder.dart';
import 'package:my_first_app/models/todoitem.dart';
import 'package:my_first_app/providers/listprovider.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => ListProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainView(),
    );
  }
}

class MainView extends StatelessWidget {
  MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        title: const Text('TIG169 - TODO', style: TextStyle(fontSize: 30)),
        backgroundColor: Colors.green,
        centerTitle: true,
        actions: [
          PopupMenuButton(
            onSelected: (String value) => {
              Provider.of<ListProvider>(context, listen: false).setFilterBy(value)
            },
            itemBuilder: (context) => [
              PopupMenuItem(child: Text('Visa alla'), value: 'all',),
              PopupMenuItem(child: Text('Gjorda'), value: 'done',),
              PopupMenuItem(child: Text('Att göra'), value: 'todo',)
            ]),
        ],
      ),
      body: Consumer<ListProvider>(builder: (context, provider, child) {
        return ListViewBuilder(filterList(provider.todoitems, provider.filterBy));
        //ListViewBuilder(provider.todoitems);
      }),
      floatingActionButton: _flotatingActionButton(context),
    );
  }

  List<TodoItem> filterList(List<TodoItem> list, String filterBy){
    if (filterBy == 'all') {return list;}
    if (filterBy == 'done') {return list.where((item) => item.done == true).toList();}
    if (filterBy == 'todo') {return list.where((item) => item.done == false).toList();}
    return [];
  }

  Widget _flotatingActionButton(context) {
    return FloatingActionButton(
      child: Icon(Icons.add, size: 50),
      backgroundColor: Colors.green,
      onPressed: () async {
        dynamic item = await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AddView()),
        );
        //print(item.toString());
        if (item != null) {
          Provider.of<ListProvider>(context, listen: false).add(item);
        }
      },
    );
  }
}

class AddView extends StatelessWidget {
  var textController = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green[100],
        appBar: AppBar(
          title: Text("Lägg till TODO"),
          backgroundColor: Colors.green,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(height: 30),
              _card(),
              Container(height: 30),
              _buttonRow(context, textController),
            ],
          ),
        ));
  }

  Widget _card() {
    return Container(
      child: Column(
        children: [
          Card(
              margin: EdgeInsets.only(left: 30, right: 30, top: 10),
              child: TextField(
                controller: textController,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    hintText: 'Vad vill du lägga till på din TODO-lista?'),
              ))
        ],
      ),
    );
  }

  Widget _buttonRow(context, textController) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            var item = TodoItem(title: textController.text);
            if (item.title.length != 0) {
              Navigator.pop(context, item);
            }
          },
          child: const Text('Lägg till'),
          style: ElevatedButton.styleFrom(primary: Colors.green),
        ),
      ],
    );
  }
}

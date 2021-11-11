import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainView(),
    );
  }
}

class MainView extends StatelessWidget {
  List <String> todo = ['Plugga', 'Städa', 'Matlagning', 'Handla', 'Träna', 'Umgås'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
        appBar: AppBar(
          title: Text('TIG169 - TODO', style: TextStyle(fontSize: 30)), 
          backgroundColor: Colors.green,
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.arrow_right_sharp),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SecondView()));
              },
            ),
          ],
        ),
        body: ListView.builder(itemCount: todo.length, itemBuilder: (context, index){
          return _listItem(todo[index]);
        }),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add, size: 50),
          backgroundColor: Colors.green,
          onPressed: () {
            Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddView()));
          },
        ),
      );
  }

  Widget _listItem(text) {
    return Container(
      margin: EdgeInsets.all(0),
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: ListTile(
          leading: Checkbox(value: false, onChanged: (value) {}),
          title: Text(text, style: TextStyle(fontSize: 25)),
          trailing: Icon(Icons.delete, size: 30.0), 
        ),
      ),
    );
  }
}

class AddView extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lägg till TODO"),
        backgroundColor: Colors.green,
      ),
    );
  }
}

class SecondView extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}

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
              icon: Icon(Icons.filter_alt_outlined),
              onPressed: () {}),
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
            _buttonRow(),
          ],
        ),
      ) 
    );
  }

  Widget _card() {
    return Container(
      child: Column(
        children: [
          Card(
            margin: EdgeInsets.only(left: 30, right: 30, top: 10),
            child: TextField(
              textAlign: TextAlign.center,
          decoration: InputDecoration(
            hintText: 'Vad vill du lägga till på din TODO-lista?' ),
            )
          )
        ],
      ),
    );
  }

  Widget _buttonRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RaisedButton(
          onPressed: () {}, 
          child: Text('Lägg till'),
          color: Colors.green,
          textColor: Colors.white,
          ),
      ],
    );
  }
}

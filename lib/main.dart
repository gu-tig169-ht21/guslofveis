import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
  List<String> todo = [
    'Plugga',
    'Städa',
    'Matlagning',
    'Handla',
    'Träna',
    'Umgås'
  ];
  List<String> filter = ['Alla', 'Gjorda', 'Ogjorda'];

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
              itemBuilder: (context) => [
                    PopupMenuItem(child: Text('Visa alla')),
                    PopupMenuItem(child: Text('Gjorda')),
                    PopupMenuItem(child: Text('Att göra'))
                  ]),
        ],
      ),
      body: ListView.builder(
          itemCount: todo.length,
          itemBuilder: (context, index) {
            return _listItem(todo[index]);
          }),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green,
              ),
              child: Text('Filtrera', style: TextStyle(fontSize: 35)),
            ),
            ListTile(
              title: const Text('Alla', style: TextStyle(fontSize: 18)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Gjorda', style: TextStyle(fontSize: 18)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Ogjorda', style: TextStyle(fontSize: 18)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add, size: 50),
        backgroundColor: Colors.green,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddView()));
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
        ));
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
                    hintText: 'Vad vill du lägga till på din TODO-lista?'),
              ))
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

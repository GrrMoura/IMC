import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    title: "só teste",
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController weightController = TextEditingController();
  TextEditingController hightController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "olasasa",
          style: TextStyle(fontSize: 30),
        ),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.refresh), onPressed: null)
        ],
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Icon(Icons.people_outline),
          TextField(
            keyboardType: TextInputType.number,
          )
        ],
      ),
    );
  }
}

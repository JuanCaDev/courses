import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => new _State();

}

class _State extends State<MyApp>{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi primera aplicación',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Mi primera aplicación'),
        ),
        body: Container(
          child: Center(
              child: Text('Hola mundo')
          ),
        ),
      ),
    );
  }
}
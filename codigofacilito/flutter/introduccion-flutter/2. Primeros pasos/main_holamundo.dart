import 'package:flutter/material.dart';

void main() {
  runApp(
      MaterialApp(
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
      )
  );
}
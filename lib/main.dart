import 'package:flutter/material.dart';
import 'package:turismo/Interfaz/Inicio/Inicio1.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final controller = PageController(initialPage: 1);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: PageView(
        children: <Widget>[
          Inicio1(),
        ],
      ),
    );
  }
}

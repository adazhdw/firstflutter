import 'package:firstflutter/route/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.amber,
      ),
      home: new HomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

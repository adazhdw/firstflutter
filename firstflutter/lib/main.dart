import 'package:firstflutter/example/main1.dart';
import 'package:firstflutter/route/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp1());

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

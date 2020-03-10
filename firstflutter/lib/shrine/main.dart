import 'package:flutter/material.dart';
import 'login.dart';



class Shrine extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(primaryColor: Colors.lightBlueAccent),
      home: new LoginPage(),
    );
  }
}
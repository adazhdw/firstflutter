import 'package:firstflutter/main1.dart';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';///第2步: 使用外部包(package)

void main() => runApp(MyApp1());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final wordPair = new WordPair.random();
    return MaterialApp(
      title: 'Flutter Demo',
      home: new Scaffold(
        appBar: new AppBar(title: new Text("Welcome to Flutter"),),
        body: new Center(child: new Text(wordPair.asPascalCase),),
      ),
    );
  }
}

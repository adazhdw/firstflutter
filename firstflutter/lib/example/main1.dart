import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

import 'login.dart';

/// *
/// 测试学习页面
class MyApp1 extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(primaryColor: Colors.lightBlueAccent),
      home: new RandomWords(),
    );
  }
}

/// 第3步:添加一个 有状态的部件（Stateful widget）
class RandomWords extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
//    return new RandomWordsState();
//    return new RandomWordsState2();
    return new RandomWordsState3();
  }
}

class RandomWordsState extends State<RandomWords> {
  @override
  Widget build(BuildContext context) {
    final wordPair = new WordPair.random();
    return new Text(wordPair.asPascalCase);
  }
}

///第4步: 创建一个无限滚动ListView
class RandomWordsState2 extends State<RandomWords> {
  final _suggestions = <WordPair>[]; //在Dart语言中使用下划线前缀标识符，会强制其变成私有的。

  final _saved = Set<WordPair>(); //保存已收藏的条目

  final _biggerFont = const TextStyle(fontSize: 18.0); //添加一个biggerFont变量来增大字体大小

  Widget _buildSuggestions() {
    return new ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        if (i.isOdd) return new Divider();
        final index = i ~/ 2;
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
//    final wordPair = new WordPair.random();
//    return new Text(wordPair.asPascalCase);

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("StartsUp Name Generator"),
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildRow(WordPair suggestion) {
    final alreadySaved = _saved.contains(suggestion);

    return new ListTile(
      title: new Text(
        suggestion.asPascalCase,
        style: _biggerFont,
      ),

      ///第5步: 添加交互
      trailing: new Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(suggestion);
          } else {
            _saved.add(suggestion);
          }
        });
      },
    );
  }
}

///第6步: 导航到新页面
class RandomWordsState3 extends RandomWordsState2 {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("StartsUp Name Generator"),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.list), onPressed: _pushSaved)
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      /*final tiles = _saved.map((pair) {
        return new ListTile(
          title: new Text(
            pair.asPascalCase,
            style: _biggerFont,
          ),
        );
      });
      final divided =
          ListTile.divideTiles(context: context, tiles: tiles).toList();
      return new Scaffold(
        appBar: new AppBar(
          title: new Text('Saved Suggestions'),
        ),
        body: new ListView(
          children: divided,
        ),
      );*/
      return new LoginPage();
    }));
  }
}

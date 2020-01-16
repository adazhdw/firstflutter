import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class MyApp1 extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
//    final wordPair = new WordPair.random();
    return MaterialApp(
      title: 'Flutter Demo',
      /*home: new Scaffold(
        appBar: new AppBar(
          title: new Text("Welcome to Flutter"),
        ),
        body: new Center(
          child: new RandomWords(),
        ),
      ),*/
      home: new RandomWords(),
    );
  }
}

/// 第3步:添加一个 有状态的部件（Stateful widget）
class RandomWords extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
//    return new RandomWordsState();
    return new RandomWordsState2();
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
        // 对于每个建议的单词对都会调用一次itemBuilder，然后将单词对添加到ListTile行中
        // 在偶数行，该函数会为单词对添加一个ListTile row.
        // 在奇数行，该函数会添加一个分割线widget，来分隔相邻的词对。
        // 注意，在小屏幕上，分割线看起来可能比较吃力。
        itemBuilder: (context, i) {
          //在每一列之前，添加一个1像素高的分割线widget,//isOdd 表示是否是奇数
          if (i.isOdd) return new Divider();
          // 语法 "i ~/ 2" 表示i除以2，但返回值是整形（向下取整），比如i为：1, 2, 3, 4, 5
          // 时，结果为0, 1, 1, 2, 2， 这可以计算出ListView中减去分隔线后的实际单词对数量
          final index = 1 ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs()
                .take(10)); //generateWordPairs()是english_words.dart库中的方法
          }
          return _buildRow(_suggestions[index]);
        });
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

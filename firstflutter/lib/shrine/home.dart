import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.menu,
              semanticLabel: 'menu',
            ),
            onPressed: () {
              print('menu button');
            }),
        title: Text('Shrine'),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.search,
                semanticLabel: 'search',
              ),
              onPressed: () {
                print('Search Button');
              }),
          IconButton(
              icon: Icon(Icons.tune, semanticLabel: 'filter'),
              onPressed: () {
                print('Filter Button');
              })
        ],
      ),
      body: GridView.count(
        crossAxisCount: 2, //指定每横行展示多少条目。
        padding: EdgeInsets.all(16.0), //给 GridView 的四周都增加了空间
        childAspectRatio: 8.0 / 9.0, //以宽高比（宽除以高）的形式定义了条目的大小
        children: _buildCardList(20),
      ),
    );
  }

  List<Card> _buildCardList(int count) {
    List<Card> cards = List.generate(
        count,
        (int index) => Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  AspectRatio(
                    aspectRatio: 18.0 / 11.0,
                    child: Image.asset('assets/images/diamond.png'),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Title',),
                        SizedBox(height: 8.0),
                        Text('Secondary Text'),
                      ],
                    ),
                  )
                ],
              ),
            ));
    return cards;
  }
}

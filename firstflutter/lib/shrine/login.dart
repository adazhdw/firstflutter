import 'package:firstflutter/shrine/home.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginState();
  }
}

class _LoginState extends State<LoginPage> {
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
//      appBar: AppBar(title: new Text('Login')),
      body: SafeArea(
          child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        children: <Widget>[
          SizedBox(height: 80.0),
          Column(
            children: <Widget>[
              Image.asset('assets/images/diamond.png'),
              SizedBox(height: 16.0),
              Text('SHRINE')
            ],
          ),
          SizedBox(height: 120.0),
          TextField(
            controller: userNameController, //用来控制文本框内容
            decoration: InputDecoration(filled: true, labelText: 'UserName'),
          ),
          SizedBox(height: 12.0),
          TextField(
            controller: passwordController, //用来控制文本框内容
            decoration: InputDecoration(filled: true, labelText: 'Password'),
            obscureText: true,
          ),
          SizedBox(height: 12.0),
          ButtonBar(
            children: <Widget>[
              FlatButton(
                  onPressed: () {
                    userNameController.clear(); //清除用户名和密码内容
                    passwordController.clear();
                  },
                  child: Text("CANCEL"),),
              RaisedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return HomePage();
                  }));
                },
                child: Text('NEXT'),
              )
            ],
          )
        ],
      )),
    );
  }
}

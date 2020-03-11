import 'package:flutter/material.dart';
import 'login.dart';
import 'package:firstflutter/colors.dart';

class Shrine extends StatelessWidget {
  // This widget is the root of your application.

  final ThemeData _kShrineTheme = _buildShrineTheme();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: new LoginPage(),
      initialRoute: '/login',
      theme: _kShrineTheme,
    );
  }
}

ThemeData _buildShrineTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    accentColor: kShrineBrown900,
    primaryColor: kShrinePink100,
    buttonColor: kShrinePink100,
    scaffoldBackgroundColor: kShrineBackgroundWhite,
    cardColor: kShrineBackgroundWhite,
    textSelectionColor: kShrinePink100,
    errorColor: kShrineErrorRed,
    textTheme: _buildTextTheme(base.textTheme),//设置body内容中字体颜色
    primaryTextTheme: _buildTextTheme(base.primaryTextTheme),//设置标题栏字体颜色
    accentTextTheme: _buildTextTheme(base.accentTextTheme),
    primaryIconTheme: base.iconTheme.copyWith(color: kShrineBrown900)//设置图标主题颜色
  );
}

TextTheme _buildTextTheme(TextTheme base) {
  return base
      .copyWith(
        headline: base.headline.copyWith(
          fontWeight: FontWeight.w500,
        ),
        title: base.title.copyWith(
          fontSize: 18.0,
        ),
        caption:
            base.caption.copyWith(fontWeight: FontWeight.w400, fontSize: 14.0),
      )
      .apply(
          fontFamily: 'Rubik',
          displayColor: kShrineBrown900,
          bodyColor: kShrineBrown900);
}

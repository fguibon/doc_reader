import 'package:doc_reader/models/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeChanger _themeChanger = Provider.of<ThemeChanger>(context);

    return new Scaffold(
        body: Container(
            child: Column(children: <Widget>[
      Text(
          "A landing page outlining what the App does, advice on use, company overview etc – free text, company logo"),
      Image.network(_themeChanger.getLogo()),
    ])));
  }
}

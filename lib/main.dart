import 'package:doc_reader/MaterialAppWithTheme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './blocs/themes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    

    return ChangeNotifierProvider<ThemeChanger>(
        builder: (_) => ThemeChanger(ThemeData.dark()),
        child: new MaterialAppWithTheme(),
    );
  }
}

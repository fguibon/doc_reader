import 'dart:convert';

import 'package:doc_reader/MaterialAppWithTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import './blocs/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.

  @override
  State<StatefulWidget> createState() => AppState();
}

class AppState extends State<MyApp> {
  var json;
  bool _isLoading=true;

  @override
  void initState() {
    super.initState();
    

  }

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider<ThemeChanger>(
      builder: (_) {
        print( _isLoading);
        retrieveJson();
        return ThemeChanger.fromJson(json);
      },
      child: new MaterialAppWithTheme(),
    );
  }

  Future<Map<String, dynamic>> parseJsonFromAssets(String assetsPath) async {
    print('--- Parse json from: $assetsPath');
    return rootBundle
        .loadString(assetsPath)
        .then((jsonStr) => jsonDecode(jsonStr));
  }

  Future retrieveJson() async {
    json = await parseJsonFromAssets('assets/theme.json');
    setState(() {
      _isLoading=false;
    });
  }
}

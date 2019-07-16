import 'package:doc_reader/models/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home_container.dart';



class MyAppWithTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);

    return MaterialApp(
      home: HomeContainer(),
      theme: theme.getTheme(),
    );
  }
}
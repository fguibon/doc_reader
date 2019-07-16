import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'blocs/theme.dart';
import 'pages/home.dart';

class MaterialAppWithTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);

    return MaterialApp(
      home: MyHomePage(),
      theme: theme.getTheme(),
    );
  }
}
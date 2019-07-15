import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'blocs/themes.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
        ThemeChanger _themeChanger = Provider.of<ThemeChanger>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            FlatButton(
                child: Text('Dark Theme'),
                onPressed: () => _themeChanger.setTheme(ThemeData.dark())),
            FlatButton(
                child: Text('Light Theme'),
                onPressed: () => _themeChanger.setTheme(ThemeData.light())),
          ],
        ),
      ),
    );
  }
}
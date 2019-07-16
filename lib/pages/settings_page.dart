import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/theme.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
        ThemeChanger theme = Provider.of<ThemeChanger>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: Container(
      ),
    );
  }
}
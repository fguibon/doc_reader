import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './models/theme.dart';
import 'containers/app_with_theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider<ThemeChanger>(
      builder: (_) {
        return ThemeChanger(
      primaryColorInt : 4286755327,
      companyName: "Excilys",
      phoneNumber: "4293913577",
      logo: "http://test.excilys.fr/wp-content/uploads/2017/01/excilys495-295.png"
    );
      },
      child: new MyAppWithTheme(),
    );
  }
}

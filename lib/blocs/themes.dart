import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  ThemeData _themeData;
  String _companyName;
  int _phoneNumber;

 ThemeChanger(this._themeData, this._companyName, this._phoneNumber);

  getTheme() => _themeData;

  setTheme(ThemeData _themeData){
    this._themeData = _themeData;

    notifyListeners();
  }


}
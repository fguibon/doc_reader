import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  ThemeData themeData;
  final int primaryColor;
  final String companyName;
  final String phoneNumber;
  final String logo;

 ThemeChanger({this.primaryColor, this.companyName, this.phoneNumber, this.logo}){
   setTheme(this.primaryColor);
 }

  getTheme() => themeData;

  setTheme(int value){
    Color color = Color(value);
    this.themeData = new ThemeData(primaryColor: color);

    notifyListeners();
  }

  

  factory ThemeChanger.fromJson(Map<String, dynamic> json) {
    return ThemeChanger(
      primaryColor : json['company.theme.colors.primary'] as int,
      companyName: json['company.name'] as String,
      phoneNumber: json['company.phone'] as String,
      logo: json['company.logo'] as String
    );
  }
}
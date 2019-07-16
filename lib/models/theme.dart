import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  ThemeData themeData;
  final int primaryColorInt;
  Color primaryColor;
  final String companyName;
  final String phoneNumber;
  final String logo;

  ThemeChanger(
      {this.primaryColorInt, this.companyName, this.phoneNumber, this.logo}) {
    setTheme(this.primaryColorInt);
  }

  getTheme() => themeData;

  setTheme(int value) {
    primaryColor = Color(value);
    this.themeData = new ThemeData(primaryColor: primaryColor);

    notifyListeners();
  }

  getLogo() => logo;
  getprimaryColorInt() => primaryColorInt;
  getPrimaryColor() => primaryColor;
  getCompanyName() => companyName;
  getPhoneNumber() => phoneNumber;

  factory ThemeChanger.fromJson(Map<String, dynamic> json) {
    return ThemeChanger(
        primaryColorInt: json['company.theme.colors.primary'] as int,
        companyName: json['company.name'] as String,
        phoneNumber: json['company.phone'] as String,
        logo: json['company.logo'] as String);
  }
}

import 'package:flutter/cupertino.dart';

class ThemeProvider extends ChangeNotifier{

  bool _isDarkMode = false;

  bool gettheme() => _isDarkMode;

  void updatetheme({required bool value}){
    _isDarkMode = value;
    notifyListeners();

  }
}
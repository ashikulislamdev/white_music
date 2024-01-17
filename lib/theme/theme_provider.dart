import 'package:flutter/material.dart';
import 'package:white_music/theme/dark_mode.dart';
import 'package:white_music/theme/light_mode.dart';

class ThemeProvider extends ChangeNotifier{
  //initial light mood
  ThemeData _themeData = lightTheme;

  //get theme
  ThemeData get themeData => _themeData;

  //is dark mood
  bool get isDarkMood => _themeData == darkTheme;

  //set theme
  set themeData(ThemeData themeData){
    _themeData = themeData;

    //change the ui
    notifyListeners();
  }

  void toggleTheme(){
    if (_themeData == lightTheme) {
      themeData = darkTheme;
    } else {
      themeData = lightTheme;
    }
  }
}
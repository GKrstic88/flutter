import 'package:flutter/material.dart';
import 'dart:math';
import '../models/theme.dart';

class ThemeProvider with ChangeNotifier {
  bool? savedTheme = false;

  bool? get _savedTheme => savedTheme;

  void updateTheme(bool update) {
    savedTheme = update;
    notifyListeners();
  }
}

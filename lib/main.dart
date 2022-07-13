import 'package:theme_change_example/models/theme.dart';
import 'provider/theme_provider.dart';
import 'shared_preferences/dark_theme.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider<ThemeProvider>(
    child: const MyApp(),
    create: (_) => ThemeProvider(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const DarkTheme();
  }
}

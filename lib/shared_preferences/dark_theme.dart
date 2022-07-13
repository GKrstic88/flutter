import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:shared_preferences/shared_preferences.dart';

class DarkTheme extends StatefulWidget {
  const DarkTheme({
    Key? key,
  }) : super(key: key);

  @override
  State<DarkTheme> createState() => _DarkThemeState();
}

class _DarkThemeState extends State<DarkTheme> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  bool? _savedTheme;

  @override
  void initState() {
    super.initState();
    _retrieveTheme();
  }

  Future<void> _retrieveTheme() async {
    final prefs = await SharedPreferences.getInstance();

    if (!prefs.containsKey('darkTheme')) {
      return;
    }
    setState(() {
      _savedTheme = prefs.getBool('darkTheme');
    });
  }

  Future<void> _saveTheme(bool switchTheme) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('darkTheme', switchTheme);
  }

  Future<void> _clearTheme() async {
    final prefs = await SharedPreferences.getInstance();

    if (!prefs.containsKey('darkTheme')) {
      return;
    }
    await prefs.remove('darkTheme');
    setState(() {
      _savedTheme = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: _savedTheme!
            ? ThemeData(primarySwatch: Colors.blue)
            : ThemeData(primarySwatch: Colors.green),
        home: Scaffold(
            appBar: AppBar(
              title: const Text('darkTheme'),
              centerTitle: true,
            ),
            body: Padding(
                padding: const EdgeInsets.all(25),
                child: _savedTheme == null
                    ? Column(
                        children: <Widget>[
                          Text('DarkTheme is saved: $_savedTheme'),
                          ElevatedButton.icon(
                            onPressed: () {
                              _savedTheme = !_savedTheme!;
                              _saveTheme(_savedTheme!);
                            },
                            icon: const Icon(
                              Icons.lightbulb,
                            ),
                            label: const Text('Change theme'),
                            style: ElevatedButton.styleFrom(
                              textStyle: const TextStyle(fontSize: 15),
                            ),
                          ),
                        ],
                      )
                    : Column(children: <Widget>[
                        Text('DarkTheme is saved: $_savedTheme'),
                        ElevatedButton.icon(
                          onPressed: () {
                            _savedTheme = !_savedTheme!;
                            _saveTheme(_savedTheme!);
                          },
                          icon: const Icon(
                            Icons.lightbulb,
                          ),
                          label: const Text('Change theme'),
                          style: ElevatedButton.styleFrom(
                            textStyle: const TextStyle(fontSize: 15),
                          ),
                        ),
                      ]))));
  }
}

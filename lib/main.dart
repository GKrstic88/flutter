//import 'package:clock_app/screens/digital_clock.dart';

import 'package:clock_app/screens/analog_clock.dart';
import 'package:clock_app/screens/digital_clock.dart';
import 'package:clock_app/topNavBar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Clock app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        'analog': (context) => const AnalogClock(),
        'digital': (context) => const DigitalClock(),
      },
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SizedBox(
        height: 86,
        child: TopNavBar(),
      ),
    );
  }
}

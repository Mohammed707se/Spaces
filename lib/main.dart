// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:spaces/map_screen.dart';
import 'package:spaces/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: TextTheme(
            bodyText1: TextStyle(fontFamily: 'DIN'),
            bodyText2: TextStyle(fontFamily: 'DIN'),
            // Add other TextStyles if needed
          ),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: splash_screen());
  }
}

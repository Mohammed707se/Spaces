// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:spaces/home_screen.dart';
import 'package:spaces/map_screen.dart';


class start_screen extends StatefulWidget {
  const start_screen({super.key});

  @override
  State<start_screen> createState() => _start_screenState();
}

class _start_screenState extends State<start_screen> {
  @override
  Widget build(BuildContext context) {
    final W = MediaQuery.of(context).size.width;
    final H = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Image.asset(
              'assets/png/Background.png'
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: H / 2.7),
                child: Image.asset(
                  'assets/png/spaces.png'
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => home_screen())
                );
              },
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(top: H / 1.4),
                  child: Image.asset(
                    'assets/png/sign_up.png'
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => home_screen())
                );
              },
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(top: H / 1.25),
                  child: Image.asset(
                    'assets/png/login.png'
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
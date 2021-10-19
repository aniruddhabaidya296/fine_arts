// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'package:finearts/ui/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants/colors.dart';
import 'constants/size_config.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fine Arts',
      theme: ThemeData(
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: COLORS.primary,
          ),
          fontFamily: GoogleFonts.exo().fontFamily),
      home: IntroSplashScreen(),
    );
  }
}

class IntroSplashScreen extends StatefulWidget {
  const IntroSplashScreen({
    Key key,
  }) : super(key: key);

  @override
  State<IntroSplashScreen> createState() => _IntroSplashScreenState();
}

class _IntroSplashScreenState extends State<IntroSplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 4),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => Home()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: COLORS.primary,
      body: Center(
        child: AnimatedContainer(
          duration: Duration(seconds: 2),
          curve: Curves.bounceIn,
          child: Text(
            "Fine Art",
            style: TextStyle(
                color: COLORS.white,
                fontFamily: 'Visby',
                fontSize: SizeConfig.blockWidth * 8,
                fontWeight: FontWeight.w900),
          ),
        ),
      ),
    );
  }
}

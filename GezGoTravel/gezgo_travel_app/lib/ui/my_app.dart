import 'package:flutter/material.dart';

import 'screens/onBoarding_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GezGo Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  const OnBoardingScreen(),
    );
  }
}
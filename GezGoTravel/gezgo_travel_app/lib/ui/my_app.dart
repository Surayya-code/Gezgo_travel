import 'package:flutter/material.dart';
import 'package:gezgo_travel_app/ui/theme/app_theme.dart';

import 'screens/on_boarding_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GezGo Demo',
      theme: AppTheme.light,
      home:  const OnBoardingScreen(),
    );
  }
}
import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const SosRespiraApp());
}

class SosRespiraApp extends StatelessWidget {
  const SosRespiraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SOS Respira',
      theme: AppTheme.lightTheme,
      home: const HomeScreen(),
    );
  }
}
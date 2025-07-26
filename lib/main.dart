import 'package:flutter/material.dart';
import 'screens/main_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Gallery App',
      /*theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFB7414F),
          foregroundColor: Colors.white,
        ),
      ),*/
      theme: AppTheme.lightTheme,
      home: const MainScreen(),
    );
  }
}

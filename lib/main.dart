import 'package:castleworld/pages/app_home/app_home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '城堡世界',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0E8AFD)),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: Colors.black,
          selectedLabelStyle: TextStyle(fontSize: 9),
          unselectedItemColor: Colors.black,
          unselectedLabelStyle: TextStyle(fontSize: 9)
        ),
        useMaterial3: true,
      ),
      home: AppHome(),

    );
  }
}


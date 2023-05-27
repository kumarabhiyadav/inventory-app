import 'package:flutter/material.dart';
import 'package:inventory_app/font_size.dart';
import 'package:inventory_app/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.black87,
        fontFamily: 'Lato',
        textTheme: TextTheme(
          headline5: TextStyle(
            fontWeight: FontWeight.w600,
            color: Theme.of(context).primaryColor,
            letterSpacing: .67,
            fontSize: h3,
          ),
          subtitle1: const TextStyle(
            fontWeight: FontWeight.w500,
            letterSpacing: .67,
          ),
          subtitle2: const TextStyle(
            fontWeight: FontWeight.w500,
            letterSpacing: .67,
          ),
        ),
      ),
      home: HomeScreen(),
    );
  }
}

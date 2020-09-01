import 'package:colorapp/screens/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ColorApp());
}

class ColorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Color App',
      home: HomeScreen(),
    );
  }
}
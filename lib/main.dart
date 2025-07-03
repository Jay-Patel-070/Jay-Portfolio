import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:jay_portfolio/pages/HomePage.dart';

void main() {
  // debugPaintSizeEnabled = true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData.dark(),
      home: Homepage(),
    );
  }
}
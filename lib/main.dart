import 'package:flutter/material.dart';
import 'package:jay_portfolio/constants/colors.dart';
import 'package:jay_portfolio/pages/HomePage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context); // listen:true by default
    final colors = themeProvider.theme;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
      theme: ThemeData(
        scaffoldBackgroundColor: colors.scaffoldBg,
        primaryColor: colors.primary,
        textTheme: TextTheme(
          bodySmall: TextStyle(color: colors.textColor),
          bodyLarge: TextStyle(color: colors.textColor),
          bodyMedium: TextStyle(color: colors.textColor),
        ),
        fontFamily: 'Sora',
        useMaterial3: true
        // add more theme properties if you want
      ),
    );
  }
}

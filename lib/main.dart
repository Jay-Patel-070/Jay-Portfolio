import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:jay_portfolio/constants/colors.dart';
import 'package:jay_portfolio/pages/HomePage.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyBAeEblGDUdjGWqesXsldIZiDbp6Q5XHNo",
        authDomain: "jay-portfolio-50ff0.firebaseapp.com",
        projectId: "jay-portfolio-50ff0",
        storageBucket: "jay-portfolio-50ff0.firebasestorage.app",
        messagingSenderId: "645314647818",
        appId: "1:645314647818:web:2a76a03c0d1216b8054cf3",
        measurementId: "G-PZQX7WVP36"
    ),
  );
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

import 'dart:ui';

import 'package:flutter/cupertino.dart';

// darkmode
// class CustomColor {
//   static const Color scaffoldBg = Color(0xFF1E1E1E);     // Background
//   static const Color primary = Color(0xFFFD6F00);        // Orange (Primary CTA)
//   static const Color accent = Color(0xFF2A2A2A);         // Cards, elevated surfaces
//   static const Color textColor = Color(0xFFFFFFFF);      // Main Text
//   static const Color secondaryTextColor = Color(0xFF959595);      // Main Text
//   static const Color borderColor = Color(0xFF3D3D3D);    // Dividers, subtle borders
// }

// lightmode
// class CustomColor{
//   static const Color scaffoldBg = Color(0xFFFFFFFF);       // Light background
//   static const Color primary = Color(0xFFFD6F00);          // Orange (Brand / CTA)
//   static const Color accent = Color(0xFFF5F5F5);           // Cards, elevated surfaces
//   static const Color textColor = Color(0xFF1E1E1E);        // Main Text (Dark)
//   static const Color secondaryTextColor = Color(0xFF6B6B6B); // Subtle text
//   static const Color borderColor = Color(0xFFE0E0E0);      // Light borders / dividers
// }

// pookiemode
// class CustomColor {
//   static const Color scaffoldBg = Color(0xFFFFF5F9);         // Clean & soft pinkish-white background
//   static const Color primary = Color(0xFFFF69B4);            // Hot pink
//   static const Color accent = Color(0xFFFFE3EE);             // Light pink cards
//   static const Color textColor = Color(0xFF6A004E);          // Deep magenta
//   static const Color secondaryTextColor = Color(0xFFA05C8C); // Soft purple
//   static const Color borderColor = Color(0xFFFFC1D9);        // Subtle pink border
// }

class ThemeColors {
  final Color scaffoldBg;
  final Color primary;
  final Color accent;
  final Color textColor;
  final Color secondaryTextColor;
  final Color borderColor;

  const ThemeColors({
    required this.scaffoldBg,
    required this.primary,
    required this.accent,
    required this.textColor,
    required this.secondaryTextColor,
    required this.borderColor,
  });
}

// Define your themes
const ThemeColors darkTheme = ThemeColors(
  scaffoldBg: Color(0xFF1E1E1E),
  primary: Color(0xFFFD6F00),
  accent: Color(0xFF2A2A2A),
  textColor: Color(0xFFFFFFFF),
  secondaryTextColor: Color(0xFF959595),
  borderColor: Color(0xFF3D3D3D),
);

const ThemeColors lightTheme = ThemeColors(
  scaffoldBg: Color(0xFFFFFFFF),
  primary: Color(0xFFFD6F00),
  accent: Color(0xFFF5F5F5),
  textColor: Color(0xFF1E1E1E),
  secondaryTextColor: Color(0xFF6B6B6B),
  borderColor: Color(0xFFE0E0E0),
);

const ThemeColors pookieTheme = ThemeColors(
  scaffoldBg: Color(0xFFFFF5F9),
  primary: Color(0xFFFF69B4),
  accent: Color(0xFFFFE3EE),
  textColor: Color(0xFF6A004E),
  secondaryTextColor: Color(0xFFA05C8C),
  borderColor: Color(0xFFFFC1D9),
);

// This class allows you to keep using CustomColor.primary etc, but dynamically
class CustomColor {
  static ThemeColors _currentTheme = lightTheme;

  static Color get scaffoldBg => _currentTheme.scaffoldBg;
  static Color get primary => _currentTheme.primary;
  static Color get accent => _currentTheme.accent;
  static Color get textColor => _currentTheme.textColor;
  static Color get secondaryTextColor => _currentTheme.secondaryTextColor;
  static Color get borderColor => _currentTheme.borderColor;

  // Update the current theme colors
  static void setTheme(ThemeColors theme) {
    _currentTheme = theme;
  }
}

class ThemeProvider with ChangeNotifier {
  ThemeColors _currentTheme = lightTheme;

  ThemeColors get theme => _currentTheme;

  void setTheme(ThemeColors theme) {
    _currentTheme = theme;
    CustomColor.setTheme(theme); // Update static CustomColor
    notifyListeners();
  }

  void toggleTheme() {
    if (_currentTheme == lightTheme) {
      setTheme(darkTheme);
    } else if (_currentTheme == darkTheme) {
      setTheme(pookieTheme);
    } else {
      setTheme(lightTheme);
    }
  }
}

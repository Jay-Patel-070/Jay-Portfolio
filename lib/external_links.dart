import 'dart:io' show Platform; // For mobile platform check
import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

/// Only import dart:html if running on web:
/// To avoid build errors for mobile apps, this import should be conditional.
/// But if you want simplest, just keep it and run on web.
import 'dart:html' as html;

class ExternalLinks {
  static Future<void> openUrl(String url) async {
    if (kIsWeb) {
      // For web, open in new tab/window
      html.window.open(url, '_blank');
    } else {
      // For mobile platforms, use url_launcher
      final Uri uri = Uri.parse(url);
      if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
        throw 'Could not launch $url';
      }
    }
  }

  static Future<void> downloadCv() async {
    await openUrl(
      'https://drive.google.com/file/d/134mW36vJQFHrBPF5JW_ZqSFtjN1SEitD/view?usp=sharing',
    );
  }

  static Future<void> openInstagram() async {
    await openUrl('https://www.instagram.com/jay_070_1?igsh=MW1vYnZtdW0yd2RqeA==');
  }

  static Future<void> openLinkedIn() async {
    await openUrl('https://www.linkedin.com/in/jay-patel-34758b272');
  }

  static Future<void> openWhatsapp() async {
    await openUrl('https://wa.me/7046881990');
  }

  static Future<void> openGitHub() async {
    await openUrl('https://github.com/Jay-Patel-070');
  }
}

import 'dart:html' as html;
import 'package:flutter/foundation.dart';

class ExternalLinks {
  static void openWebUrl(String url) {
    if (kIsWeb) {
      html.window.open(url, '_blank');
    }
  }

  static void downloadCv() {
    openWebUrl('https://drive.google.com/uc?export=download&id=1MRjLhemT-u_9Xi6xP2aOmv3MB0LV81X4');
  }

  static void openInstagram() {
    openWebUrl('https://www.instagram.com/jay_070_1?igsh=MW1vYnZtdW0yd2RqeA==');
  }

  static void openLinkedIn() {
    openWebUrl('https://www.linkedin.com/in/jay-patel-34758b272');
  }

  static void openWhatsapp() {
    openWebUrl('https://wa.me/7046881990');
  }

  static void openGitHub() {
    openWebUrl('https://github.com/Jay-Patel-070');
  }
}
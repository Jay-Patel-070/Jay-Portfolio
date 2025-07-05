import 'package:url_launcher/url_launcher.dart';

class ExternalLinks {
  static Future<void> openUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  static Future<void> downloadCv() async {
    // Replace this with your public CV URL
    const cvUrl = 'https://drive.google.com/file/d/1MRjLhemT-u_9Xi6xP2aOmv3MB0LV81X4/view?usp=drivesdk';
    await openUrl(cvUrl);
  }

  static Future<void> openInstagram() async {
    // Replace with your LinkedIn URL
    const linkedInUrl = 'https://www.instagram.com/jay_070_1?igsh=MW1vYnZtdW0yd2RqeA==';
    await openUrl(linkedInUrl);
  }

  static Future<void> openLinkedIn() async {
    // Replace with your LinkedIn URL
    const linkedInUrl = 'https://www.linkedin.com/in/jay-patel-34758b272?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app';
    await openUrl(linkedInUrl);
  }

  static Future<void> openWhatsapp() async {
    // Replace with your GitHub URL
    const gitHubUrl = 'https://wa.me/7046881990';
    await openUrl(gitHubUrl);
  }

  static Future<void> openGitHub() async {
    // Replace with your GitHub URL
    const gitHubUrl = 'https://github.com/Jay-Patel-070';
    await openUrl(gitHubUrl);
  }
}
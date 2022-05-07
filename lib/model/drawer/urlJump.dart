import 'package:url_launcher/url_launcher.dart';

void urlJump (String url) async {
  final Uri uri = Uri.parse(url);
  if (await canLaunchUrl(uri)){
    await launchUrl(uri);
  } else {
    throw 'Could not launch $url';
  }
}
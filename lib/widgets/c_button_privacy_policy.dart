import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CButtonPrivacyPolicy extends StatelessWidget {
   CButtonPrivacyPolicy({super.key});

  final Uri url = Uri.parse('https://www.google.com.br');

  @override
  Widget build(BuildContext context) {
    return Center(
        child: InkWell(
      onTap: () async {
        if (await launchUrl(url)) {
          await launchUrl(url, mode: LaunchMode.externalApplication);
        }
      },
      child: Ink(
        child: const Text(
          'Política de Privacidade',
          style: TextStyle(color: Colors.white),
        ),
      ),
    ));
  }
}

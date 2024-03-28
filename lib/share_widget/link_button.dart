// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';

class LinkButton extends StatelessWidget {
  const LinkButton({Key? key, required this.urlLabel, required this.url})
      : super(key: key);

  final String urlLabel;
  final String url;

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);

    if (!await launchUrl(uri)) {
      throw 'Could not launch $uri';
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        visualDensity: VisualDensity.compact,
        minimumSize: const Size(0, 0),
        textStyle: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      onPressed: () {
        _launchUrl(url);
      },
      child: Text(urlLabel),
    );
  }
}

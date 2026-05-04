import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          'assets/icons/settings.svg',
          height: 64,
          width: 64,
          fit: BoxFit.contain,
        ),
        SizedBox(height: 16),
        Text(
          'Settings',
          style: GoogleFonts.inter(
            color: Colors.white,
            fontSize: 36
          ),
        ),
        SizedBox(height: 16),
        Text(
          'Lana cumming soon...',
          style: GoogleFonts.inter(
            color: Color.fromARGB(255, 163,163,163),
            fontSize: 16
          ),
        ),
      ],
    );
  }
}
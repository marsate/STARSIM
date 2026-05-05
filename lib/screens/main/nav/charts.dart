import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ChartsPage extends StatefulWidget {
  const ChartsPage({super.key});

  @override
  State<ChartsPage> createState() => _ChartsPageState();
}

class _ChartsPageState extends State<ChartsPage> {

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          'assets/icons/charts/charts.svg',
          height: 64,
          width: 64,
          fit: BoxFit.contain,
        ),
        SizedBox(height: 16),
        Text(
          'Charts',
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
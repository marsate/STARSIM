import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class StorePage extends StatefulWidget {
  const StorePage({super.key});

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          'assets/icons/store/store.svg',
          height: 64,
          width: 64,
          fit: BoxFit.contain,
        ),
        SizedBox(height: 16),
        Text(
          'Store',
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
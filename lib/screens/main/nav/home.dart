import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(38, 38, 38, 0.5),
                border: Border.all(
                  color: const Color.fromRGBO(64, 64, 64, 0.5),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    'assets/icons/general/money.svg',
                    width: 16,
                    height: 16,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    "250,000",
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(38, 38, 38, 0.3),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: SvgPicture.asset(
                    'assets/icons/general/briefcase.svg',
                    height: 20,
                    width: 20,
                  ),
                ),
                SizedBox(width: 8),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(38, 38, 38, 0.3),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: SvgPicture.asset(
                    'assets/icons/general/bell.svg',
                    height: 20,
                    width: 20,
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 16),
        Container(
          height: 1,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(64, 64, 64, 0),
                Color.fromRGBO(64, 64, 64, 0.5),
                Color.fromRGBO(64, 64, 64, 0),
              ],
            ),
          ),
        ),
        SizedBox(height: 24),
        Expanded(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome, Luna Rivers',
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Here's what you can do:",
                      style: GoogleFonts.inter(
                        color: Color.fromARGB(255, 163, 163, 163),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 24),
                    Column(
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/icons/home/songs.svg',
                              height: 20,
                              width: 20,
                            ),
                            SizedBox(width: 12),
                            Text(
                              'Songs',
                              style: GoogleFonts.inter(
                                color: Colors.white,
                                height: 28 / 18,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12),
                        Container(
                          height: 1,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromRGBO(64, 64, 64, 0.5),
                                Color.fromRGBO(64, 64, 64, 0.3),
                                Color.fromRGBO(64, 64, 64, 0),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color.fromRGBO(236, 72, 153, 1),
                                      Color.fromRGBO(244, 63, 94, 1),
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.topRight,
                                  ),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Column(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/home/record_song.svg',
                                      height: 24,
                                      width: 24,
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      'Record Song',
                                      style: GoogleFonts.inter(
                                        color: Colors.white,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: 12),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color.fromRGBO(168, 85, 247, 1),
                                      Color.fromRGBO(139, 92, 246, 1),
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.topRight,
                                  ),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Column(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/home/release_song.svg',
                                      height: 24,
                                      width: 24,
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      'Release Song',
                                      style: GoogleFonts.inter(
                                        color: Colors.white,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromRGBO(59, 130, 246, 1),
                                Color.fromRGBO(6, 182, 212, 1),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.topRight,
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            children: [
                              SvgPicture.asset(
                                'assets/icons/home/sell.svg',
                                height: 24,
                                width: 24,
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Sell Song',
                                style: GoogleFonts.inter(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24),
                    Column(
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/icons/home/album.svg',
                              height: 20,
                              width: 20,
                            ),
                            SizedBox(width: 12),
                            Text(
                              'Album',
                              style: GoogleFonts.inter(
                                color: Colors.white,
                                height: 28 / 18,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12),
                        Container(
                          height: 1,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromRGBO(64, 64, 64, 0.5),
                                Color.fromRGBO(64, 64, 64, 0.3),
                                Color.fromRGBO(64, 64, 64, 0),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        IntrinsicHeight(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Color.fromRGBO(99, 102, 241, 1),
                                        Color.fromRGBO(168, 85, 247, 1),
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.topRight,
                                    ),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Column(
                                    children: [
                                      SvgPicture.asset(
                                        'assets/icons/home/album.svg',
                                        height: 24,
                                        width: 24,
                                        colorFilter: ColorFilter.mode(
                                          Colors.white,
                                          BlendMode.srcIn,
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        'Release Album',
                                        style: GoogleFonts.inter(
                                          color: Colors.white,
                                          fontSize: 12,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: 12),
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Color.fromRGBO(139, 92, 246, 1),
                                        Color.fromRGBO(217, 70, 239, 1),
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.topRight,
                                    ),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Column(
                                    children: [
                                      SvgPicture.asset(
                                        'assets/icons/home/alternatives_album.svg',
                                        height: 24,
                                        width: 24,
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        'Album Versions',
                                        style: GoogleFonts.inter(
                                          color: Colors.white,
                                          fontSize: 12,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: 12),
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Color.fromRGBO(168, 85, 247, 1),
                                        Color.fromRGBO(236, 72, 153, 1),
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.topRight,
                                    ),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Column(
                                    children: [
                                      SvgPicture.asset(
                                        'assets/icons/home/sell.svg',
                                        height: 24,
                                        width: 24,
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        'Sell Album',
                                        style: GoogleFonts.inter(
                                          color: Colors.white,
                                          fontSize: 12,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24),
                    Column(
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/icons/home/promote.svg',
                              height: 20,
                              width: 20,
                            ),
                            SizedBox(width: 12),
                            Text(
                              'Promote',
                              style: GoogleFonts.inter(
                                color: Colors.white,
                                height: 28 / 18,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12),
                        Container(
                          height: 1,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromRGBO(64, 64, 64, 0.5),
                                Color.fromRGBO(64, 64, 64, 0.3),
                                Color.fromRGBO(64, 64, 64, 0),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromRGBO(59, 130, 246, 1),
                                Color.fromRGBO(99, 102, 241, 1),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.topRight,
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            children: [
                              SvgPicture.asset(
                                'assets/icons/home/radio.svg',
                                height: 24,
                                width: 24,
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Radio',
                                style: GoogleFonts.inter(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 12),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color.fromRGBO(249, 115, 22, 1),
                                      Color.fromRGBO(239, 68, 68, 1),
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.topRight,
                                  ),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Column(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/home/billboards.svg',
                                      height: 24,
                                      width: 24,
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      'Billboards',
                                      style: GoogleFonts.inter(
                                        color: Colors.white,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: 12),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color.fromRGBO(234, 179, 8, 1),
                                      Color.fromRGBO(249, 115, 22, 1),
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.topRight,
                                  ),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Column(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/home/opportunities.svg',
                                      height: 24,
                                      width: 24,
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      'Opportunities',
                                      style: GoogleFonts.inter(
                                        color: Colors.white,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 24),
                    Column(
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/icons/home/streaming.svg',
                              height: 20,
                              width: 20,
                            ),
                            SizedBox(width: 12),
                            Text(
                              'Streaming Services',
                              style: GoogleFonts.inter(
                                color: Colors.white,
                                height: 28 / 18,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12),
                        Container(
                          height: 1,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromRGBO(64, 64, 64, 0.5),
                                Color.fromRGBO(64, 64, 64, 0.3),
                                Color.fromRGBO(64, 64, 64, 0),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromRGBO(34, 197, 94, 1),
                                Color.fromRGBO(16, 185, 129, 1),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.topRight,
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            children: [
                              SvgPicture.asset(
                                'assets/icons/home/vibely.svg',
                                height: 24,
                                width: 24,
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Vibely',
                                style: GoogleFonts.inter(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 12),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color.fromRGBO(239, 68, 68, 1),
                                      Color.fromRGBO(236, 72, 153, 1),
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.topRight,
                                  ),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Column(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/home/meloflow.svg',
                                      height: 24,
                                      width: 24,
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      'Meloflow',
                                      style: GoogleFonts.inter(
                                        color: Colors.white,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: 12),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color.fromRGBO(249, 115, 22, 1),
                                      Color.fromRGBO(245, 158, 11, 1),
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.topRight,
                                  ),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Column(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/home/sonicflow.svg',
                                      height: 24,
                                      width: 24,
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      'SonicFlow',
                                      style: GoogleFonts.inter(
                                        color: Colors.white,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: 12),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color.fromRGBO(220, 38, 38, 1),
                                      Color.fromRGBO(249, 115, 22, 1),
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.topRight,
                                  ),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Column(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/home/velor.svg',
                                      height: 24,
                                      width: 24,
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      'Velor',
                                      style: GoogleFonts.inter(
                                        color: Colors.white,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

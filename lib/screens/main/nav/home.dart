import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class ActionTileData {
  final String title;
  final String iconPath;
  final List<Color> gradient;

  ActionTileData({
    required this.title,
    required this.iconPath,
    required this.gradient,
  });
}

class ActionTile extends StatefulWidget {
  final ActionTileData data;

  const ActionTile({super.key, required this.data});

  @override
  State<ActionTile> createState() => _ActionTileState();
}

class _ActionTileState extends State<ActionTile> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _pressed = true),
      onTapUp: (_) => setState(() => _pressed = false),
      onTapCancel: () => setState(() => _pressed = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 120),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: widget.data.gradient,
            begin: Alignment.topLeft,
            end: Alignment.topRight,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      widget.data.iconPath,
                      height: 24,
                      width: 24,
                      colorFilter: const ColorFilter.mode(
                        Colors.white,
                        BlendMode.srcIn,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      widget.data.title,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 120),
                  opacity: _pressed ? 0.3 : 0.0,
                  child: Container(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HomePageState extends State<HomePage> {
  Widget tile(ActionTileData data) {
    return SizedBox(
      width: double.infinity,
      child: ActionTile(data: data),
    );
  }

  Widget twoTiles(List<ActionTileData> items) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Expanded(child: tile(items[0])),
          const SizedBox(width: 12),
          Expanded(child: tile(items[1])),
        ],
      ),
    );
  }

  Widget threeTiles(List<ActionTileData> items) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Expanded(child: tile(items[0])),
          const SizedBox(width: 12),
          Expanded(child: tile(items[1])),
          const SizedBox(width: 12),
          Expanded(child: tile(items[2])),
        ],
      ),
    );
  }

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
                        twoTiles([
                          ActionTileData(
                            title: 'Record Song',
                            iconPath: 'assets/icons/home/record_song.svg',
                            gradient: [
                              Color.fromRGBO(236, 72, 153, 1),
                              Color.fromRGBO(244, 63, 94, 1),
                            ],
                          ),
                          ActionTileData(
                            title: 'Release Song',
                            iconPath: 'assets/icons/home/release_song.svg',
                            gradient: [
                              Color.fromRGBO(168, 85, 247, 1),
                              Color.fromRGBO(139, 92, 246, 1),
                            ],
                          ),
                        ]),
                        SizedBox(height: 12),
                        tile(
                          ActionTileData(
                            title: 'Sell Song',
                            iconPath: 'assets/icons/home/sell.svg',
                            gradient: [
                              Color.fromRGBO(59, 130, 246, 1),
                              Color.fromRGBO(6, 182, 212, 1),
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
                        threeTiles([
                          ActionTileData(
                            title: 'Release Album',
                            iconPath: 'assets/icons/home/album.svg',
                            gradient: [
                              Color.fromRGBO(99, 102, 241, 1),
                              Color.fromRGBO(168, 85, 247, 1),
                            ],
                          ),
                          ActionTileData(
                            title: 'Album Versions',
                            iconPath:
                                'assets/icons/home/alternatives_album.svg',
                            gradient: [
                              Color.fromRGBO(139, 92, 246, 1),
                              Color.fromRGBO(217, 70, 239, 1),
                            ],
                          ),
                          ActionTileData(
                            title: 'Sell Album',
                            iconPath: 'assets/icons/home/sell.svg',
                            gradient: [
                              Color.fromRGBO(168, 85, 247, 1),
                              Color.fromRGBO(236, 72, 153, 1),
                            ],
                          ),
                        ]),
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
                        tile(
                          ActionTileData(
                            title: 'Radio',
                            iconPath: 'assets/icons/home/radio.svg',
                            gradient: [
                              Color.fromRGBO(59, 130, 246, 1),
                              Color.fromRGBO(99, 102, 241, 1),
                            ],
                          ),
                        ),
                        SizedBox(height: 12),
                        twoTiles([
                          ActionTileData(
                            title: 'Billboards',
                            iconPath: 'assets/icons/home/billboards.svg',
                            gradient: [
                              Color.fromRGBO(249, 115, 22, 1),
                              Color.fromRGBO(239, 68, 68, 1),
                            ],
                          ),
                          ActionTileData(
                            title: 'Opportunities',
                            iconPath: 'assets/icons/home/opportunities.svg',
                            gradient: [
                              Color.fromRGBO(234, 179, 8, 1),
                              Color.fromRGBO(249, 115, 22, 1),
                            ],
                          ),
                        ]),
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
                        tile(
                          ActionTileData(
                            title: 'Vibely',
                            iconPath: 'assets/icons/home/vibely.svg',
                            gradient: [
                              Color.fromRGBO(34, 197, 94, 1),
                              Color.fromRGBO(16, 185, 129, 1),
                            ],
                          ),
                        ),
                        SizedBox(height: 12),
                        threeTiles([
                          ActionTileData(
                            title: 'Meloflow',
                            iconPath: 'assets/icons/home/meloflow.svg',
                            gradient: [
                              Color.fromRGBO(239, 68, 68, 1),
                              Color.fromRGBO(236, 72, 153, 1),
                            ],
                          ),
                          ActionTileData(
                            title: 'SonicFlow',
                            iconPath: 'assets/icons/home/sonicflow.svg',
                            gradient: [
                              Color.fromRGBO(249, 115, 22, 1),
                              Color.fromRGBO(245, 158, 11, 1),
                            ],
                          ),
                          ActionTileData(
                            title: 'Velor',
                            iconPath: 'assets/icons/home/velor.svg',
                            gradient: [
                              Color.fromRGBO(220, 38, 38, 1),
                              Color.fromRGBO(249, 115, 22, 1),
                            ],
                          ),
                        ]),
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

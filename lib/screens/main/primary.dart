import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:starsim_app/screens/main/nav/charts.dart';
import 'package:starsim_app/screens/main/nav/home.dart';
import 'package:starsim_app/screens/main/nav/profile.dart';
import 'package:starsim_app/screens/main/nav/setings.dart';
import 'package:starsim_app/screens/main/nav/store.dart';

class PrimaryPage extends StatefulWidget {
  const PrimaryPage({super.key});

  @override
  State<PrimaryPage> createState() => _PrimaryPageState();
}

class _PrimaryPageState extends State<PrimaryPage> {
  int selectedIndex = 0;

  final List<Color> tabColors = [
    Color.fromARGB(255, 96, 165, 250),
    Color.fromARGB(255, 74, 222, 128),
    Color.fromARGB(255, 251, 146, 60),
    Color.fromARGB(255, 167, 139, 250),
    Color.fromARGB(255, 163, 163, 163),
  ];

  final List<Widget> pages = [
    HomePage(),
    StorePage(),
    ChartsPage(),
    ProfilePage(),
    SettingsPage(),
  ];

  Widget navItem({
    required String label,
    required String iconPath,
    required int index,
  }) {
    final bool isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isSelected
              ? Color.fromRGBO(38, 38, 38, 0.3)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              iconPath,
              width: 24,
              height: 24,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 4),
            Text(
              label,
              style: GoogleFonts.inter(
                color: isSelected
                    ? tabColors[index]
                    : Color.fromARGB(255, 163, 163, 163),
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Center(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromRGBO(23, 23, 23, 0.8),
                            Color.fromRGBO(23, 23, 23, 0.4),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(
                          color: Color.fromRGBO(60, 60, 67, 0.29),
                          width: 0.74,
                          style: BorderStyle.solid,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.25),
                            blurRadius: 50,
                            offset: Offset(0, 25),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(24),
                        child: pages[selectedIndex],
                      ),
                    ),
                  ),
                  SizedBox(height: 24),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromRGBO(23, 23, 23, 0.8),
                          Color.fromRGBO(23, 23, 23, 0.4),
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(
                        color: Color.fromRGBO(60, 60, 67, 0.29),
                        width: 0.74,
                        style: BorderStyle.solid,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.25),
                          blurRadius: 50,
                          offset: Offset(0, 25),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          navItem(
                            label: "Home",
                            iconPath: "assets/icons/home/home.svg",
                            index: 0,
                          ),
                          navItem(
                            label: "Store",
                            iconPath: "assets/icons/store/store.svg",
                            index: 1,
                          ),
                          navItem(
                            label: "Charts",
                            iconPath: "assets/icons/charts/charts.svg",
                            index: 2,
                          ),
                          navItem(
                            label: "Profile",
                            iconPath: "assets/icons/profile/profile.svg",
                            index: 3,
                          ),
                          navItem(
                            label: "Settings",
                            iconPath: "assets/icons/settings/settings.svg",
                            index: 4,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

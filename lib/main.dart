import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'firebase_options.dart';

import 'package:starsim_app/screens/auth/signup.dart';
import 'package:starsim_app/screens/main/primary.dart';
import 'widgets/background.dart';
import 'widgets/logo.dart';
import 'screens/auth/signin.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const AppRoot(),
    );
  }
}

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [
        Background(),
        SplashWrapper(),
      ],
    );
  }
}

enum Navigation { logo, signIn, signUp, primary }

class SplashWrapper extends StatefulWidget {
  const SplashWrapper({super.key});

  @override
  State<SplashWrapper> createState() => _SplashWrapperState();
}

class _SplashWrapperState extends State<SplashWrapper> {
  Navigation screen = Navigation.logo;

  @override
  void initState() {
    super.initState();

    _checkAuth();

    // keep your splash delay
    Timer(const Duration(seconds: 3), () {
      if (!mounted) return;
      _checkAuth();
    });
  }

  void _checkAuth() {
    final user = FirebaseAuth.instance.currentUser;

    setState(() {
      screen = user != null ? Navigation.primary : Navigation.signIn;
    });
  }

  void goToSignUp() {
    setState(() => screen = Navigation.signUp);
  }

  void goToSignIn() {
    setState(() => screen = Navigation.signIn);
  }

  void goToPrimary() {
    setState(() => screen = Navigation.primary);
  }

  void logout() async {
    await FirebaseAuth.instance.signOut();
    setState(() => screen = Navigation.signIn);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: IgnorePointer(
            child: Opacity(
              opacity: 0.02,
              child: CustomPaint(painter: GridPainter()),
            ),
          ),
        ),

        AnimatedSwitcher(
          duration: const Duration(milliseconds: 400),
          child: _buildScreen(),
        ),
      ],
    );
  }

  Widget _buildScreen() {
    return Material(
      type: MaterialType.transparency,
      child: switch (screen) {
        Navigation.logo => const Logo(),

        Navigation.signIn => SignInPage(
          onNavigateToSignUp: goToSignUp,
          onLoginSuccess: goToPrimary,
        ),

        Navigation.signUp => SignUpPage(
          onNavigateToSignIn: goToSignIn,
          onLoginSuccess: goToPrimary,
        ),

        Navigation.primary => PrimaryPage(),
      },
    );
  }
}
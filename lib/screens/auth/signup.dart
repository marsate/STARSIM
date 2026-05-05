import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpPage extends StatefulWidget {
  final VoidCallback onNavigateToSignIn;
  final VoidCallback onLoginSuccess;

  const SignUpPage({
    super.key,
    required this.onNavigateToSignIn,
    required this.onLoginSuccess,
  });

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final FocusNode _codeFocus = FocusNode();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController codeController = TextEditingController();

  bool _loading = false;
  String? _errorMessage;

  Future<void> _signUp() async {
    setState(() {
      _errorMessage = null;
      _loading = true;
    });

    try {
      final email = emailController.text.trim();
      final password = passwordController.text.trim();
      final code = codeController.text.trim();

      if (email.isEmpty || password.isEmpty) {
        setState(() {
          _errorMessage = "Email and password are required";
          _loading = false;
        });
        return;
      }

      final cred = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final uid = cred.user!.uid;

      await FirebaseFirestore.instance.collection('users').doc(uid).set({
        'email': email,
        'createdAt': FieldValue.serverTimestamp(),
        'referralCodeUsed': code.isNotEmpty ? code : null,
        'referredBy': null,
        'artistName': null,
      });

      widget.onLoginSuccess();
    } on FirebaseAuthException catch (e) {
      setState(() {
        _errorMessage = e.message ?? "Sign up failed";
      });
    } catch (e, stack) {
      debugPrint("SIGNUP ERROR: $e");
      debugPrintStack(stackTrace: stack);

      setState(() {
        _errorMessage = e.toString();
      });
    }

    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    super.initState();

    _emailFocus.addListener(() {
      if (!mounted) return;
      setState(() {});
    });

    _passwordFocus.addListener(() {
      if (!mounted) return;
      setState(() {});
    });

    _codeFocus.addListener(() {
      if (!mounted) return;
      setState(() {});
    });
  }

  @override
  void dispose() {
    _emailFocus.dispose();
    _passwordFocus.dispose();
    _codeFocus.dispose();
    super.dispose();
  }

  bool get _emailFocused => _emailFocus.hasFocus;
  bool get _passwordFocused => _passwordFocus.hasFocus;
  bool get _codeFocused => _codeFocus.hasFocus;
  bool _signUpPressed = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(24),
      child: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final double width = constraints.maxWidth > 384
                ? 384
                : constraints.maxWidth;

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: width,
                  child: Image.asset(
                    'assets/images/logo.png',
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: width,
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
                        offset: const Offset(0, 25),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(32),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          height: 4,
                          width: 80,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(255, 59, 130, 246),
                                Color.fromARGB(255, 139, 92, 246),
                                Color.fromARGB(255, 236, 72, 153),
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                        SizedBox(height: 32),
                        SizedBox(
                          width: double.infinity,
                          child: Padding(
                            padding: EdgeInsets.only(left: 4),
                            child: Text(
                              "Email",
                              style: GoogleFonts.inter(
                                color: Color.fromARGB(255, 212, 212, 212),
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        Stack(
                          children: [
                            if (_emailFocused)
                              Positioned.fill(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color.fromRGBO(
                                          59,
                                          130,
                                          246,
                                          0.2,
                                        ),
                                        blurRadius: 2,
                                        spreadRadius: 1,
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                            Theme(
                              data: Theme.of(context).copyWith(
                                textSelectionTheme: TextSelectionThemeData(
                                  selectionColor: Color.fromRGBO(
                                    59,
                                    130,
                                    246,
                                    0.2,
                                  ),
                                  selectionHandleColor: Color.fromRGBO(
                                    59,
                                    130,
                                    246,
                                    0.2,
                                  ),
                                ),
                              ),
                              child: TextField(
                                controller: emailController,
                                focusNode: _emailFocus,
                                style: GoogleFonts.inter(color: Colors.white),
                                decoration: InputDecoration(
                                  prefixIcon: Padding(
                                    padding: EdgeInsets.only(
                                      left: 18,
                                      top: 18,
                                      bottom: 18,
                                      right: 9,
                                    ),
                                    child: SvgPicture.asset(
                                      'assets/icons/authentication/email.svg',
                                      width: 20,
                                      height: 20,
                                      fit: BoxFit.contain,
                                      colorFilter: ColorFilter.mode(
                                        _emailFocus.hasFocus
                                            ? Color.fromARGB(128, 59, 130, 246)
                                            : Color.fromARGB(
                                                255,
                                                115,
                                                115,
                                                115,
                                              ),
                                        BlendMode.srcIn,
                                      ),
                                    ),
                                  ),
                                  contentPadding: EdgeInsets.all(22),
                                  hintText: 'artist@starsim.music',
                                  hintStyle: GoogleFonts.inter(
                                    color: Color.fromARGB(255, 82, 82, 82),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide: BorderSide(
                                      color: Color.fromARGB(255, 38, 38, 38),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide: BorderSide(
                                      color: Color.fromARGB(128, 59, 130, 246),
                                    ),
                                  ),
                                  filled: true,
                                  fillColor: Color.fromARGB(255, 16, 14, 17),
                                ),
                                cursorColor: Colors.white,
                                cursorWidth: 0.8,
                                cursorHeight: 18,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        SizedBox(
                          width: double.infinity,
                          child: Padding(
                            padding: EdgeInsets.only(left: 4),
                            child: Text(
                              "Password",
                              style: GoogleFonts.inter(
                                color: Color.fromARGB(255, 212, 212, 212),
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        Stack(
                          children: [
                            if (_passwordFocused)
                              Positioned.fill(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color.fromRGBO(
                                          139,
                                          92,
                                          246,
                                          0.2,
                                        ),
                                        blurRadius: 2,
                                        spreadRadius: 1,
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                            Theme(
                              data: Theme.of(context).copyWith(
                                textSelectionTheme: TextSelectionThemeData(
                                  selectionColor: Color.fromARGB(
                                    128,
                                    139,
                                    92,
                                    246,
                                  ),
                                  selectionHandleColor: Color.fromARGB(
                                    128,
                                    139,
                                    92,
                                    246,
                                  ),
                                ),
                              ),
                              child: TextField(
                                controller: passwordController,
                                focusNode: _passwordFocus,
                                style: GoogleFonts.inter(color: Colors.white),
                                obscureText: true,
                                decoration: InputDecoration(
                                  prefixIcon: Padding(
                                    padding: EdgeInsets.only(
                                      left: 18,
                                      top: 18,
                                      bottom: 18,
                                      right: 9,
                                    ),
                                    child: SvgPicture.asset(
                                      'assets/icons/authentication/password.svg',
                                      width: 20,
                                      height: 20,
                                      fit: BoxFit.contain,
                                      colorFilter: ColorFilter.mode(
                                        _passwordFocus.hasFocus
                                            ? Color.fromARGB(128, 139, 92, 246)
                                            : Color.fromARGB(
                                                255,
                                                115,
                                                115,
                                                115,
                                              ),
                                        BlendMode.srcIn,
                                      ),
                                    ),
                                  ),
                                  contentPadding: EdgeInsets.all(22),
                                  hintText: '••••••••',
                                  hintStyle: GoogleFonts.inter(
                                    color: Color.fromARGB(255, 82, 82, 82),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide: BorderSide(
                                      color: Color.fromARGB(255, 38, 38, 38),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide: BorderSide(
                                      color: Color.fromARGB(128, 139, 92, 246),
                                    ),
                                  ),
                                  filled: true,
                                  fillColor: Color.fromARGB(255, 16, 14, 17),
                                ),
                                cursorColor: Colors.white,
                                cursorWidth: 0.8,
                                cursorHeight: 18,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        SizedBox(
                          width: double.infinity,
                          child: Padding(
                            padding: EdgeInsets.only(left: 4),
                            child: Text(
                              "Referral Code (Optional)",
                              style: GoogleFonts.inter(
                                color: Color.fromARGB(255, 212, 212, 212),
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        Stack(
                          children: [
                            if (_codeFocused)
                              Positioned.fill(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color.fromRGBO(
                                          236,
                                          72,
                                          153,
                                          0.2,
                                        ),
                                        blurRadius: 2,
                                        spreadRadius: 1,
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                            Theme(
                              data: Theme.of(context).copyWith(
                                textSelectionTheme: TextSelectionThemeData(
                                  selectionColor: Color.fromARGB(
                                    128,
                                    236,
                                    72,
                                    153,
                                  ),
                                  selectionHandleColor: Color.fromARGB(
                                    128,
                                    236,
                                    72,
                                    153,
                                  ),
                                ),
                              ),
                              child: TextField(
                                controller: codeController,
                                focusNode: _codeFocus,
                                style: GoogleFonts.inter(color: Colors.white),
                                decoration: InputDecoration(
                                  prefixIcon: Padding(
                                    padding: EdgeInsets.only(
                                      left: 18,
                                      top: 18,
                                      bottom: 18,
                                      right: 9,
                                    ),
                                    child: SvgPicture.asset(
                                      'assets/icons/authentication/code.svg',
                                      width: 20,
                                      height: 20,
                                      fit: BoxFit.contain,
                                      colorFilter: ColorFilter.mode(
                                        _codeFocus.hasFocus
                                            ? Color.fromARGB(128, 236, 72, 153)
                                            : Color.fromARGB(
                                                255,
                                                115,
                                                115,
                                                115,
                                              ),
                                        BlendMode.srcIn,
                                      ),
                                    ),
                                  ),
                                  contentPadding: EdgeInsets.all(22),
                                  hintText: 'Enter code',
                                  hintStyle: GoogleFonts.inter(
                                    color: Color.fromARGB(255, 82, 82, 82),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide: BorderSide(
                                      color: Color.fromARGB(255, 38, 38, 38),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide: BorderSide(
                                      color: Color.fromARGB(128, 236, 72, 153),
                                    ),
                                  ),
                                  filled: true,
                                  fillColor: Color.fromARGB(255, 16, 14, 17),
                                ),
                                cursorColor: Colors.white,
                                cursorWidth: 0.8,
                                cursorHeight: 18,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 52),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(255, 21, 93, 252),
                                Color.fromARGB(255, 127, 34, 254),
                                Color.fromARGB(255, 152, 16, 250),
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: ElevatedButton(
                            onPressed: _loading ? null : _signUp,
                            style:
                                ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  shadowColor: Colors.transparent,
                                ).copyWith(
                                  overlayColor: WidgetStateProperty.resolveWith(
                                    (states) {
                                      if (states.contains(
                                        WidgetState.pressed,
                                      )) {
                                        return Colors.white.withValues(
                                          alpha: 0.2,
                                        );
                                      }
                                      return Colors.transparent;
                                    },
                                  ),
                                ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 16),
                              child: _loading
                                  ? SizedBox(
                                      height: 18,
                                      width: 18,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                      ),
                                    )
                                  : Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        SvgPicture.asset(
                                          'assets/icons/general/star.svg',
                                          fit: BoxFit.contain,
                                        ),

                                        SizedBox(width: 8),

                                        Text(
                                          'Start Your Career',
                                          style: GoogleFonts.inter(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                            ),
                          ),
                        ),
                        AnimatedSize(
                          duration: Duration(milliseconds: 200),
                          child: _errorMessage == null
                              ? SizedBox.shrink()
                              : Padding(
                                  padding: const EdgeInsets.only(top: 12),
                                  child: Text(
                                    _errorMessage!,
                                    style: GoogleFonts.inter(
                                      color: Colors.red,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                        ),
                        SizedBox(height: 32),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 1,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color.fromRGBO(64, 32, 64, 0),
                                      Color.fromRGBO(64, 64, 64, 0.5),
                                      Color.fromRGBO(64, 64, 64, 0),
                                    ],
                                  ),
                                ),
                              ),
                            ),

                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12),
                              child: Text(
                                "OR",
                                style: GoogleFonts.inter(
                                  color: Color.fromARGB(255, 82, 82, 82),
                                  fontSize: 12,
                                ),
                              ),
                            ),

                            Expanded(
                              child: Container(
                                height: 1,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color.fromRGBO(64, 32, 64, 0),
                                      Color.fromRGBO(64, 64, 64, 0.5),
                                      Color.fromRGBO(64, 64, 64, 0),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 32),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an account?",
                              style: GoogleFonts.inter(
                                color: Color.fromARGB(255, 163, 163, 163),
                                fontSize: 14,
                              ),
                            ),

                            SizedBox(width: 8),

                            GestureDetector(
                              onTap: () {
                                setState(() => _signUpPressed = false);
                                widget.onNavigateToSignIn();
                              },
                              onTapDown: (_) {
                                setState(() => _signUpPressed = true);
                                widget.onNavigateToSignIn();
                              },
                              onTapUp: (_) {
                                setState(() => _signUpPressed = false);
                                widget.onNavigateToSignIn();
                              },
                              onTapCancel: () {
                                setState(() => _signUpPressed = false);
                              },
                              child: Text(
                                "Sign In",
                                style: GoogleFonts.inter(
                                  color: _signUpPressed
                                      ? Color.fromARGB(255, 147, 197, 253)
                                      : Color.fromARGB(255, 96, 165, 250),
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 24),
                Text(
                  'Join thousands of artists worldwide',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    color: Color.fromARGB(255, 82, 82, 82),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

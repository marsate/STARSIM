import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInPage extends StatefulWidget {
  final VoidCallback onNavigateToSignUp;
  final VoidCallback onLoginSuccess;

  const SignInPage({
    super.key,
    required this.onNavigateToSignUp,
    required this.onLoginSuccess,
  });

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String? _errorMessage;
  String _mapFirebaseError(String code) {
    switch (code) {
      case "user-not-found":
        return "No account found for this email";
      case "wrong-password":
        return "Incorrect password";
      case "invalid-email":
        return "Invalid email address";
      case "user-disabled":
        return "This account has been disabled";
      default:
        return "Login failed. Please try again.";
    }
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
  }

  @override
  void dispose() {
    _emailFocus.dispose();
    _passwordFocus.dispose();
    super.dispose();
  }

  bool get _emailFocused => _emailFocus.hasFocus;
  bool get _passwordFocused => _passwordFocus.hasFocus;
  bool _forgotPressed = false;
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
                        offset: Offset(0, 25),
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
                                onChanged: (_) {
                                  if (_errorMessage != null) {
                                    setState(() {
                                      _errorMessage = null;
                                    });
                                  }
                                },
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
                        Padding(
                          padding: EdgeInsets.only(left: 4, right: 4),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Password",
                                style: GoogleFonts.inter(
                                  color: Color.fromARGB(255, 212, 212, 212),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() => _forgotPressed = false);
                                },
                                onTapDown: (_) {
                                  setState(() => _forgotPressed = true);
                                },
                                onTapUp: (_) {
                                  setState(() => _forgotPressed = false);
                                },
                                onTapCancel: () {
                                  setState(() => _forgotPressed = false);
                                },
                                child: Text(
                                  "Forgot Password?",
                                  style: GoogleFonts.inter(
                                    color: _forgotPressed
                                        ? Color.fromARGB(255, 59, 130, 246)
                                        : Color.fromARGB(255, 161, 161, 161),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
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
                                onChanged: (_) {
                                  if (_errorMessage != null) {
                                    setState(() {
                                      _errorMessage = null;
                                    });
                                  }
                                },
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
                            onPressed: () async {
                              setState(() {
                                _errorMessage = null;
                              });

                              try {
                                await FirebaseAuth.instance
                                    .signInWithEmailAndPassword(
                                      email: emailController.text.trim(),
                                      password: passwordController.text.trim(),
                                    );

                                widget.onLoginSuccess();
                              } on FirebaseAuthException catch (e) {
                                setState(() {
                                  _errorMessage = _mapFirebaseError(e.code);
                                });
                              } catch (_) {
                                setState(() {
                                  _errorMessage = "Something went wrong";
                                });
                              }
                            },
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
                              child: Text(
                                'Sign In',
                                style: GoogleFonts.inter(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
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
                              "Don't have an account?",
                              style: GoogleFonts.inter(
                                color: Color.fromARGB(255, 163, 163, 163),
                                fontSize: 14,
                              ),
                            ),

                            SizedBox(width: 8),

                            GestureDetector(
                              onTap: () {
                                setState(() => _signUpPressed = false);
                                widget.onNavigateToSignUp();
                              },
                              onTapDown: (_) {
                                setState(() => _signUpPressed = true);
                                widget.onNavigateToSignUp();
                              },
                              onTapUp: (_) {
                                setState(() => _signUpPressed = false);
                                widget.onNavigateToSignUp();
                              },
                              onTapCancel: () {
                                setState(() => _signUpPressed = false);
                              },
                              child: Text(
                                "Sign Up",
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
                  'Welcome back to STARSIM',
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

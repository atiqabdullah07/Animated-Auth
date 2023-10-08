import 'dart:math';

import 'package:animated_login/constants.dart';
import 'package:flutter/material.dart';

import 'Widgets/login_form.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage>
    with SingleTickerProviderStateMixin {
  bool isSignUpPage = false;
  late AnimationController _animationController;
  late Animation<double> _animationText;

  void setUpAnimation() {
    _animationController =
        AnimationController(vsync: this, duration: defaultDuration);
    _animationText =
        Tween<double>(begin: 0, end: 90).animate(_animationController);
  }

  @override
  void initState() {
    setUpAnimation();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void updateView() {
    setState(() {
      isSignUpPage = !isSignUpPage;
    });

    isSignUpPage
        ? _animationController.forward()
        : _animationController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: AnimatedBuilder(
          animation: _animationController,
          builder: (context, _) {
            return Stack(
              children: [
                AnimatedPositioned(
                  duration: defaultDuration,
                  width: size.width * 0.88,
                  height: size.height,
                  // left: isSignUpPage ? size.width * 0.76 : 0,
                  child: Container(
                    color: backgroundLogin,
                    child: const Center(child: LoginForm()),
                  ),
                ),
                AnimatedPositioned(
                    duration: defaultDuration,
                    height: size.height,
                    width: size.width * 0.88,
                    left: isSignUpPage ? size.width * 0.12 : size.width * 0.88,
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Color(0xFF2DD4BD), Color(0xFF7BC1F2)],
                        ),
                      ),
                      child: const Center(child: SignUpForm()),
                    )),
                AnimatedPositioned(
                  duration: defaultDuration,
                  top: size.height * 0.01,
                  left: 0,
                  right: isSignUpPage ? -size.width * 0.06 : size.width * 0.1,
                  child: Container(
                    margin: const EdgeInsets.only(top: 120),
                    height: 140,
                    width: 140,
                    child: Image.asset(
                      "assets/logo2.png",
                      width: 20,
                    ),
                  ),
                ),
                AnimatedPositioned(
                    duration: defaultDuration,
                    bottom: size.height * 0.15,
                    width: size.width,
                    right:
                        isSignUpPage ? -size.width * 0.06 : size.width * 0.06,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/facebook.png",
                          width: 60,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Image.asset(
                          "assets/google.png",
                          width: 60,
                        ),
                      ],
                    )),
                AnimatedPositioned(
                    duration: defaultDuration,
                    bottom:
                        isSignUpPage ? size.height / 2 - 80 : size.height * 0.3,
                    left: isSignUpPage ? 0 : size.width * 0.44 - 80,
                    child: AnimatedDefaultTextStyle(
                      duration: defaultDuration,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: isSignUpPage ? 20 : 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white70),
                      child: Transform.rotate(
                        angle: -_animationText.value * pi / 180,
                        alignment: Alignment.topLeft,
                        child: InkWell(
                          onTap: updateView,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: defaultPadding * 0.75),
                            width: 160,
                            child: ShaderMask(
                              shaderCallback: (Rect bounds) {
                                return const LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Color(0xFF2DD4BD),
                                    Color(0xFF7BC1F2)
                                  ],
                                ).createShader(bounds);
                              },
                              child: Text(
                                "Sign Up",
                                style: TextStyle(
                                  fontSize: isSignUpPage ? 20 : 32,
                                  fontWeight: FontWeight.bold,
                                  color: Colors
                                      .white, // This is the fallback color in case the gradient doesn't work.
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )),
                AnimatedPositioned(
                    duration: defaultDuration,
                    bottom: !isSignUpPage
                        ? size.height / 2 - 80
                        : size.height * 0.25,
                    right: isSignUpPage ? size.width * 0.44 - 80 : 0,
                    child: AnimatedDefaultTextStyle(
                      duration: defaultDuration,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: !isSignUpPage ? 20 : 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white70),
                      child: Transform.rotate(
                        angle: (90 - _animationText.value) * pi / 180,
                        alignment: Alignment.topRight,
                        child: InkWell(
                          onTap: updateView,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: defaultPadding * 0.75),
                            width: 160,
                            child: const Text(
                              "Login",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    )),
              ],
            );
          }),
    );
  }
}

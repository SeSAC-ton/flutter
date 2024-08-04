import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../ui/color_styles.dart';
import '../../ui/text_styles.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      context.go('/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF4A90E2), Color(0xFF50E3C2)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Slow quiz',
                  style: Fonts.tittleTextBold.copyWith(
                    color: ColorStyles.white,
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Team.',
                    style: Fonts.mediumTextRegular.copyWith(
                      color: ColorStyles.white,
                    ),
                  ),
                  Image.asset(
                    'assets/avocado.png',
                    width: 24,
                    height: 24,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

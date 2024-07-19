import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sesac_ton/util/constant.dart';

import '../../ui/color_styles.dart';
import '../../ui/text_styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            serviceName,
            style: Fonts.largeTextBold.copyWith(
              color: ColorStyles.black,
            ),
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipOval(
                child: Image.asset(
                  'assets/mascot.png',
                  width: 270,
                  height: 270,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 30),
              Text(
                '오늘 하루는 어떘어? [문구]',
                style: Fonts.largeTextBold.copyWith(
                  color: ColorStyles.black,
                ),
              ),
              const SizedBox(height: 100),
              InkWell(
                onTap: () {
                  context.push('/worksheet');
                },
                borderRadius: BorderRadius.circular(50),
                child: SizedBox(
                  width: 80,
                  height: 80,
                  child: ClipOval(
                    child: Center(
                      child: Image.asset(
                        'assets/chat_icon.png',
                        width: 270,
                        height: 270,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

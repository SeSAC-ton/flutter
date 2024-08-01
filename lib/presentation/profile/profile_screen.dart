import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sesac_ton/util/network.dart';

import '../../ui/color_styles.dart';
import '../../ui/text_styles.dart';
import '../../util/constant.dart';
import '../component/big_button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          serviceName,
          style: Fonts.largeTextBold.copyWith(
            color: ColorStyles.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Center(
              child: Column(
                children: [
                  ClipOval(
                    child: Image.asset(
                      'assets/mascot.png',
                      width: 170,
                      height: 170,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '$userName 님의 발자취를 확인해보세요👋',
                    style: Fonts.smallTextRegular.copyWith(
                      color: ColorStyles.black,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            BigButton(
              title: '발자취 확인',
              onTap: () {
                context.push('/solved_worksheet');
              },
              leading: Image.asset(
                'assets/bear_footprint.png',
                width: 36,
                height: 36,
              ),
            ),
            const SizedBox(height: 10),
            BigButton(
              title: '업적 확인',
              leading: Image.asset(
                'assets/tropy_icon.png',
                width: 36,
                height: 36,
              ),
              onTap: () {
                context.push('/achievement');
              },
            ),
            const Spacer(),
            BigButton(
              title: '로그 아웃',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

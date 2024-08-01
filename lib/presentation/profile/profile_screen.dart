import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sesac_ton/data/model/worksheet/worksheet.dart';
import 'package:sesac_ton/presentation/profile/profile_view_model.dart';
import 'package:sesac_ton/util/network.dart';

import '../../ui/color_styles.dart';
import '../../ui/text_styles.dart';
import '../../util/constant.dart';
import '../component/big_button.dart';
import 'component/worksheet_card_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ProfileViewModel>();
    final solveProblems = viewModel.solveProblems;
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
              onTap: () {},
              leading: Image.asset(
                'assets/bear_footprint.png',
                width: 36,
                height: 36,
              ),
            ),
            const SizedBox(height: 10),
            BigButton(
              title: '업적 확인',
              onTap: () {},
              leading: Image.asset(
                'assets/tropy.png',
                width: 36,
                height: 36,
              ),
            ),
            const SizedBox(height: 10),
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

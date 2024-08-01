import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sesac_ton/presentation/component/big_button.dart';
import 'package:sesac_ton/presentation/home/home_view_model.dart';
import 'package:sesac_ton/util/constant.dart';
import 'package:sesac_ton/util/network.dart';

import '../../ui/color_styles.dart';
import '../../ui/text_styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewmodel = context.watch<HomeViewModel>();
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              context.push('/profile');
            },
            icon: const Icon(Icons.settings),
          ),
        ],
        centerTitle: true,
        title: Text(
          serviceName,
          style: Fonts.largeTextBold.copyWith(
            color: ColorStyles.black,
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
              const SizedBox(height: 50),
              Text(
                '한 걸음 내딛어 볼까요?',
                style: Fonts.largeTextBold.copyWith(
                  color: ColorStyles.black,
                ),
              ),
              // const SizedBox(height: 50),
              const Spacer(),
              Text(
                '$userName님의 능력을 기를 수 있는',
                style: Fonts.mediumTextBold.copyWith(
                  color: ColorStyles.grey2,
                ),
              ),
              Text(
                '문제들이 준비 되어 있어요!',
                style: Fonts.mediumTextBold.copyWith(
                  color: ColorStyles.grey2,
                ),
              ),
              const Spacer(),
              BigButton(
                title: '둘러 보기',
                onTap: () {
                  context.push('/worksheet');
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

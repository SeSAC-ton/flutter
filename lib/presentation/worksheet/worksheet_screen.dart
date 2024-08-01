import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sesac_ton/presentation/worksheet/category_button_view.dart';
import 'package:sesac_ton/presentation/worksheet/worksheet_card_view.dart';
import 'package:sesac_ton/util/constant.dart';
import 'package:sesac_ton/util/network.dart';

import '../../ui/color_styles.dart';
import '../../ui/text_styles.dart';

class WorksheetScreen extends StatelessWidget {
  const WorksheetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          serviceName,
          style: Fonts.largeTextBold.copyWith(
            color: ColorStyles.black,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              context.push('/profile');
            },
            child: ClipOval(
              child: Image.asset(
                'assets/chat_icon.png',
                width: 48,
                height: 48,
              ),
            ),
          ),
          const SizedBox(width: 10)
        ],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '반가워요 $userName님 👋',
                style: Fonts.largeTextBold.copyWith(
                  color: ColorStyles.black,
                ),
              ),
              const SizedBox(height: 10),
              // AI 질문 던지기
              GestureDetector(
                onTap: () {
                  context.push('/chat');
                },
                child: Container(
                  width: double.infinity,
                  height: 55,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1.5,
                      color: ColorStyles.grey2,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    color: ColorStyles.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Text(
                          'AI에게 직접 물어볼까요?',
                          style: Fonts.smallTextRegular.copyWith(
                            color: ColorStyles.grey3,
                          ),
                        ),
                        const Spacer(),
                        const Icon(Icons.search)
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                '카테고리',
                style: Fonts.largeTextBold.copyWith(
                  color: ColorStyles.black,
                ),
              ),
              const CategoryButtonView(),
              const WorksheetCardView(),
            ],
          ),
        ),
      ),
    );
  }
}

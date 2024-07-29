import 'package:flutter/material.dart';
import 'package:sesac_ton/presentation/worksheet/category_button_view.dart';
import 'package:sesac_ton/presentation/worksheet/worksheet_card_view.dart';

import '../../ui/color_styles.dart';
import '../../ui/text_styles.dart';
import '../component/input_field.dart';

class WorksheetScreen extends StatelessWidget {
  const WorksheetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          ClipOval(
            child: Image.asset(
              'assets/chat_icon.png',
              width: 48,
              height: 48,
            ),
          ),
          const SizedBox(width: 10)
        ],
        title: Text(
          '반가워요 [사용자]님 👋',
          style: Fonts.largeTextBold.copyWith(
            color: ColorStyles.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // AI 질문 던지기
            InputField(
              placeHolder: '이름을 입력해주세요.',
              onChanged: (String text) {},
              maxLength: 15,
              topPadding: 30,
              icon: const Icon(Icons.search),
            ),
            const SizedBox(height: 20),
            Text(
              '카테고리',
              style: Fonts.largeTextBold.copyWith(
                color: ColorStyles.black,
              ),
            ),
            const CategoryButtonView(),
            const WorksheetCardView()
          ],
        ),
      ),
    );
  }
}

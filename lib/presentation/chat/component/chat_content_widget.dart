import 'package:flutter/material.dart';

import '../../../ui/color_styles.dart';
import '../../../ui/text_styles.dart';

class ChatContentWidget extends StatelessWidget {
  final String request;
  final String response;

  const ChatContentWidget(
      {super.key, required this.request, required this.response});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end, // 사용자 텍스트를 오른쪽으로 정렬
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 5),
              child: Text(
                '사용자',
                style: Fonts.smallTextBold.copyWith(
                  color: ColorStyles.primary100,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              margin: const EdgeInsets.only(left: 30),
              decoration: BoxDecoration(
                color: ColorStyles.white,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  request,
                  style: Fonts.smallTextRegular.copyWith(
                    color: ColorStyles.black,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Text(
            'AI',
            style: Fonts.smallTextBold.copyWith(
              color: ColorStyles.primary100,
            ),
          ),
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                margin: const EdgeInsets.only(right: 30),
                decoration: BoxDecoration(
                  color: ColorStyles.white,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Text(
                    response,
                    style: Fonts.smallTextRegular.copyWith(
                      color: ColorStyles.black,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}

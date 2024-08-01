import 'package:flutter/material.dart';
import 'package:sesac_ton/data/model/worksheet/worksheet.dart';

import '../../../ui/color_styles.dart';

class SolvedWorksheetWidget extends StatelessWidget {
  final void Function() onTap;
  final String title;
  final bool isCorrect;

  const SolvedWorksheetWidget({
    super.key,
    required this.onTap,
    required this.title,
    required this.isCorrect,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
            height: 50,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            decoration: BoxDecoration(
              color: (isCorrect) ? ColorStyles.primary60 : ColorStyles.secondary20,
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                color: (isCorrect) ? ColorStyles.primary100 : ColorStyles.secondary60,
                width: 1.0,
              ),
            ),
            child: Row(
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: ColorStyles.grey1,
                  ),
                ),
                const Spacer(),
                Center(
                  child: Image.asset(
                    'assets/pencil_icon.png',
                    width: 20, // 아이콘 크기 설정
                    height: 20,
                    color: ColorStyles.grey1,
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

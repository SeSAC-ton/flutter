import 'package:flutter/material.dart';

import '../../ui/color_styles.dart';
import '../../ui/text_styles.dart';

class TitleWidget extends StatelessWidget {
  final String title;

  const TitleWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        color: ColorStyles.white,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: ColorStyles.white,
          width: 1.0,
        ),
      ),
      child: Center(
        child: Text(
          title,
          style: Fonts.smallTextBold.copyWith(
            color: ColorStyles.black,
          ),
        ),
      ),
    );
  }
}

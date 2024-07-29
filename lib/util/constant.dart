import 'dart:ui';

import 'package:sesac_ton/ui/color_styles.dart';

const serviceName = '슬로 퀴즈';
const regOnlyKorean =
    r'[ㄱ-ㅎ|ㅏ-ㅣ|가-힣|ᆞ|ᆢ|ㆍ|ᆢ|ᄀᆞ|ᄂᆞ|ᄃᆞ|ᄅᆞ|ᄆᆞ|ᄇᆞ|ᄉᆞ|ᄋᆞ|ᄌᆞ|ᄎᆞ|ᄏᆞ|ᄐᆞ|ᄑᆞ|ᄒᆞ]';

enum Category {
  personal(title: '개인 생활', color: ColorStyles.primary100),
  social(title: '사회 생활', color: ColorStyles.second),
  relation(title: '대인 관계', color: ColorStyles.third),
  job(title: '직업 활동', color: ColorStyles.fourth);

  final String title;
  final Color color;

  const Category({required this.title, required this.color});
}

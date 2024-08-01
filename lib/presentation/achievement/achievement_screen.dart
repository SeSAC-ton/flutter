import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sesac_ton/presentation/achievement/achievement_view_model.dart';

import '../../ui/color_styles.dart';
import '../../ui/text_styles.dart';

class AchievementScreen extends StatelessWidget {
  const AchievementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<AchievementViewModel>();
    final achievements = viewModel.achievements;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '업적',
          style: Fonts.largeTextBold.copyWith(
            color: ColorStyles.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: (viewModel.isLoading)
            ? const Center(
                child: SizedBox(
                  child: CircularProgressIndicator(
                    strokeWidth: 3,
                  ),
                ),
              )
            : GridView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                ),
                children: [
                  ...achievements.map(
                    (achievement) {
                      print(achievement.isAttainment);
                      final String assetImage = (achievement.isAttainment)
                          ? 'assets/tropy_fill.png'
                          : 'assets/tropy.png';
                      final Color backgroundColor = (achievement.isAttainment)
                          ? ColorStyles.primary60
                          : ColorStyles.secondary40;
                      return Container(
                        margin: const EdgeInsets.all(8.0),
                        padding: const EdgeInsets.only(
                            top: 24, bottom: 8, left: 6, right: 6),
                        decoration: BoxDecoration(
                          color: backgroundColor,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Column(
                          children: [
                            Image.asset(assetImage),
                            const Spacer(),
                            Text(
                              achievement.subTitle,
                              style: Fonts.mediumTextBold.copyWith(
                                color: ColorStyles.warningRed,
                              ),
                            ),
                            Text(
                              achievement.title,
                              style: Fonts.smallerTextBold
                                  .copyWith(color: ColorStyles.black2),
                            ),
                            const SizedBox(height: 5),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
      ),
    );
  }
}

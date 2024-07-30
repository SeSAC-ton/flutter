import 'package:flutter/material.dart';
import 'package:sesac_ton/presentation/problem/problem_view.dart';

import '../../ui/color_styles.dart';
import '../../ui/text_styles.dart';
import 'animation/emoji_widget.dart';

class ProblemScreen extends StatefulWidget {
  const ProblemScreen({super.key});

  @override
  State<ProblemScreen> createState() => _ProblemScreenState();
}

class _ProblemScreenState extends State<ProblemScreen> {
  EmojiFireWork emojiFireWork =
      EmojiFireWork(emojiAsset: const AssetImage('assets/heart.png'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '문제 풀기',
          style: Fonts.largeTextBold.copyWith(
            color: ColorStyles.black,
          ),
        ),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            child: ProblemView(
              workAnimation: () {
                setState(() {
                  emojiFireWork.addFireworkWidget();
                });
              },
            ),
          ),
          Positioned(
            width: 200,
            height: 200,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Stack(
                  children: emojiFireWork.fireworkWidgets.values.toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

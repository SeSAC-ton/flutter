import 'package:flutter/material.dart';

import '../../../data/model/worksheet/option.dart';
import '../../../ui/color_styles.dart';
import '../../../ui/text_styles.dart';

class OptionWidget extends StatefulWidget {
  final Option option;

  const OptionWidget({
    super.key,
    required this.option,
  });

  @override
  State<OptionWidget> createState() => _OptionWidgetState();
}

class _OptionWidgetState extends State<OptionWidget> {
  Color buttonColor = ColorStyles.grey2;

  @override
  Widget build(BuildContext context) {
    buttonColor =
        widget.option.isAnswer ? ColorStyles.primary60 : ColorStyles.warningRed;
    final Widget icon = (widget.option.isAnswer)
        ? const Icon(Icons.check)
        : const Icon(Icons.close);

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: (widget.option.isAnswer) ? buttonColor : ColorStyles.white,
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          border: Border.all(
            width: 1,
            color: buttonColor,
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Text(
              widget.option.name,
              style: Fonts.normalTextSemiBold.copyWith(
                color: ColorStyles.black,
              ),
            ),
            Positioned(
              right: 10,
              child: icon, // 아이콘을 오른쪽 끝에 배치
            ),
          ],
        ),
      ),
    );
  }
}

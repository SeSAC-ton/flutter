import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sesac_ton/presentation/solved_worksheet/component/solved_worksheet_widget.dart';
import 'package:sesac_ton/presentation/solved_worksheet/solved_worksheet_view_model.dart';

import '../../ui/color_styles.dart';
import '../../ui/text_styles.dart';

class SovledWorksheetSreen extends StatelessWidget {
  const SovledWorksheetSreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewmodel = context.watch<SolvedWorksheetViewModel>();
    final worksheets = viewmodel.worksheets;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '내 발자취',
          style: Fonts.largeTextBold.copyWith(
            color: ColorStyles.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: worksheets.length,
                itemBuilder: (context, index) {
                  return SolvedWorksheetWidget(
                    title: worksheets[index].solvedWorksheetTitle,
                    isCorrect: worksheets[index].isCorrect,
                    onTap: () {
                      context.push(
                          '/foot_print/${worksheets[index].solvedWorksheetId}');
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

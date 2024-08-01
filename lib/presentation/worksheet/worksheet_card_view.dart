import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sesac_ton/presentation/worksheet/worksheet_view_model.dart';
import 'package:sesac_ton/ui/color_styles.dart';

import 'component/worksheet_card_widget.dart';

class WorksheetCardView extends StatelessWidget {
  const WorksheetCardView({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = [
      ColorStyles.primary100,
      ColorStyles.second,
      ColorStyles.third,
      ColorStyles.fourth
    ];
    final viewModel = context.watch<WorksheetViewModel>();
    final worksheets = viewModel.worksheets;
    return SizedBox(
      height: 185,
      width: double.infinity,
      child: GridView(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
        ),
        children: [
          ...worksheets.mapIndexed(
            (index, worksheet) => WorksheetCardWidget(
              title: worksheet.title,
              color: colors[index],
              imageUrl: worksheet.imageUrl,
              onTab: () {
                context.push('/explain/${worksheet.id}');
              },
            ),
          )
        ],
      ),
    );
  }
}

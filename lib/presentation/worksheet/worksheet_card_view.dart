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
    final viewModel = Provider.of<WorksheetViewModel>(context);
    final worksheets = viewModel.worksheets;
    return Expanded(
      child: GridView(
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
                // 임시
                context.push('/explain/${worksheet.id}');
              },
            ),
          )
        ],
      ),
    );
  }
}

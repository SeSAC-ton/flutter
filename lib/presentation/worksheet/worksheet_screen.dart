import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sesac_ton/presentation/component/worksheet_card_widget.dart';
import 'package:sesac_ton/util/constant.dart';

import '../../ui/color_styles.dart';
import '../../ui/text_styles.dart';
import 'worksheet_view_model.dart';

class WorksheetScreen extends StatelessWidget {
  const WorksheetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            serviceName,
            style: Fonts.largeTextBold.copyWith(
              color: ColorStyles.black,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '어서오세요! (인사 문구)',
              style: Fonts.largeTextBold.copyWith(
                color: ColorStyles.black,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              '오늘은 어제의 나를 위해서 (문구)',
              style: Fonts.smallerTextRegular.copyWith(
                color: ColorStyles.grey1,
              ),
            ),
            const SizedBox(height: 10),
            Consumer<WorksheetViewModel>(
              builder: (context, viewModel, child) {
                final worksheets = viewModel.worksheets;
                return Expanded(
                  child: ListView.builder(
                    itemCount: worksheets.length,
                    itemBuilder: (context, index) {
                      return WorksheetCardWidget(
                        worksheetTitle: worksheets[index],
                        onTap: () {},
                      );
                    },
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

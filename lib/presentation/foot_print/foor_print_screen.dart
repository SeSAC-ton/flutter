import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sesac_ton/presentation/foot_print/component/option_widget.dart';
import 'package:sesac_ton/presentation/foot_print/foot_print_view_model.dart';

import '../../data/model/worksheet/option.dart';
import '../../ui/color_styles.dart';
import '../../ui/text_styles.dart';
import '../component/content_widget.dart';
import '../component/option_button.dart';
import '../component/title_widget.dart';

class FootPrintScreen extends StatefulWidget {
  const FootPrintScreen({super.key});

  @override
  State<FootPrintScreen> createState() => _FootPrintScreenState();
}

class _FootPrintScreenState extends State<FootPrintScreen> {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<FootPrintViewModel>();
    final footPrint = viewModel.foorPrint;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '회고',
          style: Fonts.largeTextBold.copyWith(
            color: ColorStyles.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: (viewModel.isLoading)
            ? const Center(
                child: SizedBox(
                  child: CircularProgressIndicator(
                    strokeWidth: 3,
                  ),
                ),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleWidget(title: footPrint.title),
                  const SizedBox(height: 20),
                  ContentWidget(content: footPrint.content),
                  const SizedBox(height: 20),
                  ...footPrint.options.map(
                    (Option option) => OptionWidget(
                      option: option,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

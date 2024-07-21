import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sesac_ton/presentation/component/big_button.dart';
import 'package:sesac_ton/presentation/component/content_widget.dart';
import 'package:sesac_ton/presentation/explain/explain_view_model.dart';

import '../../ui/color_styles.dart';
import '../../ui/text_styles.dart';
import '../../util/constant.dart';
import '../component/title_widget.dart';

class ExplainScreen extends StatelessWidget {
  const ExplainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final int id = int.parse(GoRouterState.of(context).pathParameters['id']!);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.pop();
          },
        ),
        centerTitle: true,
        title: Text(
          serviceName,
          style: Fonts.largeTextBold.copyWith(
            color: ColorStyles.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: Consumer<ExplainViewModel>(
          builder: (context, viewModel, child) {
            final explain = viewModel.explain;
            return (viewModel.isLoading)
                ? const Center(
                    child: SizedBox(
                      child: CircularProgressIndicator(
                        strokeWidth: 3,
                      ),
                    ),
                  )
                : Column(
                    children: [
                      TitleWidget(title: explain.title),
                      const SizedBox(height: 20),
                      ContentWidget(
                        content: explain.content,
                        height: 500,
                      ),
                      const Spacer(),
                      BigButton(
                          title: '문제 풀기',
                          onTap: () {
                            context.push('/problem/$id');
                          }),
                      const SizedBox(height: 20),
                    ],
                  );
          },
        ),
      ),
    );
  }
}

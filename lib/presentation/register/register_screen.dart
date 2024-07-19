import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sesac_ton/presentation/register/register_view_model.dart';

import '../../ui/color_styles.dart';
import '../../ui/text_styles.dart';
import '../component/big_button.dart';
import '../component/input_field.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 50, 30, 27),
          child: Consumer<RegisterViewModel>(
            builder: (context, viewModel, child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('회원 가입',
                      style: Fonts.headerTextBold.copyWith(
                        color: ColorStyles.black,
                      )),

                  // 이름
                  InputField(
                    label: '이름',
                    placeHolder: '이름 입력해주세요.',
                    onChanged: (String text) {
                      viewModel.nameValue = text;
                    },
                    topPadding: 30,
                  ),

                  // 아이디
                  InputField(
                    label: '아이디',
                    placeHolder: '아이디를 입력해주세요.',
                    onChanged: (String text) {
                      viewModel.idValue = text;
                    },
                    topPadding: 30,
                  ),

                  // 비밀번호
                  InputField(
                    label: '비밀번호',
                    placeHolder: '비밀번호를 입력해주세요.',
                    onChanged: (String text) {
                      viewModel.passwordValue = text;
                    },
                    topPadding: 30,
                  ),

                  // 비밀번호 확인
                  InputField(
                    label: '비밀번호 확인',
                    placeHolder: '다시 입력해주세요.',
                    onChanged: (String text) {
                      viewModel.passwordCheckValue = text;
                    },
                    topPadding: 30,
                  ),

                  const SizedBox(height: 30),

                  BigButton(
                    title: '회원 가입 완료',
                    onTap: () async {
                      await viewModel.registerUser();
                      if (viewModel.errorMessage.isEmpty) {
                        context.go('/login');
                      }
                    },
                  ),

                  // Login Fail
                  if (viewModel.errorMessage.isNotEmpty)
                    const SizedBox(height: 10),
                  Text(
                    viewModel.errorMessage,
                    style: Fonts.smallerTextBold.copyWith(
                      color: ColorStyles.warningRed,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

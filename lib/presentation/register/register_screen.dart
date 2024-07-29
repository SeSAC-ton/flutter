import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sesac_ton/presentation/component/warning_text.dart';
import 'package:sesac_ton/presentation/register/register_view_model.dart';

import '../../ui/color_styles.dart';
import '../../ui/text_styles.dart';
import '../../util/constant.dart';
import '../component/big_button.dart';
import '../component/input_field.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(30, 20, 30, 27),
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
                    placeHolder: '이름을 입력해주세요.',
                    onChanged: (String text) {
                      viewModel.nameValue = text;
                    },
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(regOnlyKorean))
                    ],
                    maxLength: 15,
                    topPadding: 30,
                  ),

                  // 아이디
                  InputField(
                    label: '아이디',
                    placeHolder: '아이디를 입력해주세요. (영어와 숫자만)',
                    keyboardType: TextInputType.visiblePassword,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9]')),
                    ],
                    onChanged: (String text) {
                      viewModel.idValue = text;
                      viewModel.checkUserId(text);
                    },
                    maxLength: 15,
                    topPadding: 30,
                  ),
                  if (viewModel.checkUserIdErrorMessage.isNotEmpty)
                    WarningText(text: viewModel.checkUserIdErrorMessage),

                  // 비밀번호
                  InputField(
                    label: '비밀번호',
                    placeHolder: '비밀번호를 입력해주세요.',
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9]')),
                    ],
                    onChanged: (String text) {
                      viewModel.passwordValue = text;
                      viewModel.checkMatchPassword();
                    },
                    maxLength: 15,
                    topPadding: 30,
                  ),

                  // 비밀번호 확인
                  InputField(
                    label: '비밀번호 확인',
                    placeHolder: '다시 입력해주세요.',
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9]')),
                    ],
                    onChanged: (String text) {
                      viewModel.passwordCheckValue = text;
                      viewModel.checkMatchPassword();
                    },
                    maxLength: 15,
                    topPadding: 30,
                  ),
                  if (viewModel.matchPassword)
                    const WarningText(text: '비밀번호가 일치하지 않습니다.'),

                  // 생년 월일
                  InputField(
                    label: '생년 월일',
                    placeHolder: 'ex_991231',
                    onChanged: (String text) {
                      viewModel.birthValue = text;
                    },
                    keyboardType: TextInputType.number,
                    topPadding: 30,
                    maxLength: 6,
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
                    WarningText(text: viewModel.errorMessage),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

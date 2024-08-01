import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../ui/color_styles.dart';
import '../../ui/text_styles.dart';
import '../component/big_button.dart';
import '../component/input_field.dart';
import 'login_view_model.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30, 50, 30, 27),
            child: Consumer<LoginViewModel>(
              builder: (context, viewModel, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('반가워요',
                        style: Fonts.headerTextBold.copyWith(
                          color: ColorStyles.black,
                        )),

                    Text(
                      '궁금한 것 모두 찾아보세요!',
                      style: Fonts.largeTextRegular.copyWith(
                        color: ColorStyles.black2,
                      ),
                    ),
                    // Email TextField
                    InputField(
                      label: '아이디',
                      placeHolder: '아이디를 입력해주세요.',
                      onChanged: (String text) {
                        viewModel.idValue = text;
                      },
                      topPadding: 57,
                    ),
                    // Password TextField
                    InputField(
                      label: '비밀번호',
                      placeHolder: '비밀번호를 입력해주세요.',
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      onChanged: (String text) {
                        viewModel.passwordValue = text;
                      },
                      topPadding: 30,
                    ),

                    const SizedBox(height: 30),

                    BigButton(
                      title: '로그인',
                      onTap: () async {
                        await viewModel.loginUser();
                        if (viewModel.successLogin) {
                          context.go('/home');
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

                    // Sing up
                    GestureDetector(
                      onTap: () {
                        context.push('/register');
                      },
                      child: Column(
                        children: [
                          // 이미지 추가
                          Padding(
                            padding: const EdgeInsets.only(top: 30, bottom: 30),
                            child: Center(
                              child: ClipOval(
                                child: Image.asset(
                                  'assets/login_mascot.png',
                                  width: 140,
                                  height: 140,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: '계정이 없으신가요?',
                                      style: Fonts.smallerTextBold.copyWith(
                                        color: ColorStyles.black,
                                      ),
                                    ),
                                    TextSpan(
                                      text: ' 회원가입 하기',
                                      style: Fonts.smallTextBold.copyWith(
                                        color: ColorStyles.secondary100,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

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
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 50, 30, 27),
          child: Consumer<LoginViewModel>(
            builder: (context, viewModel, child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Hello',
                      style: Fonts.headerTextBold.copyWith(
                        color: ColorStyles.black,
                      )),

                  Text(
                    'welcome Back!',
                    style: Fonts.largeTextRegular.copyWith(
                      color: ColorStyles.black2,
                    ),
                  ),
                  // Email TextField
                  InputField(
                    label: 'Email',
                    placeHolder: 'Enter Email',
                    onChanged: (String text) {
                      viewModel.idValue = text;
                    },
                    topPadding: 57,
                  ),
                  // Password TextField
                  InputField(
                    label: 'Enter Password',
                    placeHolder: 'Enter Password',
                    onChanged: (String text) {
                      viewModel.passwordValue = text;
                    },
                    topPadding: 30,
                  ),

                  const SizedBox(height: 30),

                  BigButton(
                    title: 'Sign In',
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
                      context.go('/register');
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 55),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Don’t have an account? ',
                                  style: Fonts.smallerTextBold.copyWith(
                                    color: ColorStyles.black,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Sign up',
                                  style: Fonts.smallerTextBold.copyWith(
                                    color: ColorStyles.secondary100,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

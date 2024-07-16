import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sesac_ton/presentation/home/home_screen.dart';

import '../../data/repository/member_repository/member_repository.dart';
import '../../ui/color_styles.dart';
import '../../ui/text_styles.dart';
import '../component/big_button.dart';
import '../component/input_field.dart';
import '../register/register_screen.dart';
import 'login_view_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _controllerWithId = TextEditingController();
  final TextEditingController _controllerWithPassword = TextEditingController();
  String idValue = '';
  String passwordValue = '';

  @override
  void dispose() {
    _controllerWithId.dispose();
    _controllerWithPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginViewModel(),
      child: Scaffold(
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
                        idValue = text;
                      },
                      topPadding: 57,
                      controller: _controllerWithId,
                    ),
                    // Password TextField
                    InputField(
                      label: 'Enter Password',
                      placeHolder: 'Enter Password',
                      onChanged: (String text) {
                        passwordValue = text;
                      },
                      topPadding: 30,
                      controller: _controllerWithPassword,
                    ),

                    const SizedBox(height: 30),

                    BigButton(
                      title: 'Sign In',
                      onTap: () async {
                        await viewModel.loginUser(idValue, passwordValue);
                        if (viewModel.successLogin) {
                          Navigator.pushNamed(context, '/home');
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
                        Navigator.pushNamed(context, '/register');
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
      ),
    );
  }
}

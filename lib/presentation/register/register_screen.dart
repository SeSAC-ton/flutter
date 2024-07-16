import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sesac_ton/data/model/member/register/register_info.dart';
import 'package:sesac_ton/presentation/login/login_screen.dart';
import 'package:sesac_ton/presentation/register/register_view_model.dart';

import '../../data/repository/member_repository/member_repository.dart';
import '../../ui/color_styles.dart';
import '../../ui/text_styles.dart';
import '../component/big_button.dart';
import '../component/input_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _controllerWithId = TextEditingController();
  final TextEditingController _controllerWithPassword = TextEditingController();
  final TextEditingController _controllerWithPasswordCheck =
      TextEditingController();
  final TextEditingController _controllerWithName = TextEditingController();
  String idValue = '';
  String passwordValue = '';
  String passwordCheckValue = '';
  String nameValue = '';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RegisterViewModel(),
      child: Scaffold(
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
                        nameValue = text;
                      },
                      topPadding: 30,
                      controller: _controllerWithName,
                    ),

                    // 아이디
                    InputField(
                      label: '아이디',
                      placeHolder: '아이디를 입력해주세요.',
                      onChanged: (String text) {
                        idValue = text;
                      },
                      topPadding: 30,
                      controller: _controllerWithId,
                    ),

                    // 비밀번호
                    InputField(
                      label: '비밀번호',
                      placeHolder: '비밀번호를 입력해주세요.',
                      onChanged: (String text) {
                        passwordValue = text;
                      },
                      topPadding: 30,
                      controller: _controllerWithPassword,
                    ),

                    // 비밀번호 확인
                    InputField(
                      label: '비밀번호 확인',
                      placeHolder: '다시 입력해주세요.',
                      onChanged: (String text) {
                        passwordCheckValue = text;
                      },
                      topPadding: 30,
                      controller: _controllerWithPasswordCheck,
                    ),

                    const SizedBox(height: 30),

                    BigButton(
                      title: '회원 가입 완료',
                      onTap: () async {
                        await viewModel.registerUser(
                          RegisterInfo(
                            id: idValue,
                            password: passwordValue,
                            passwordCheck: passwordCheckValue,
                            name: nameValue,
                          ),
                        );
                        if (viewModel.errorMessage.isNotEmpty) {
                          Navigator.pushNamed(context, '/login');
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
      ),
    );
  }
}

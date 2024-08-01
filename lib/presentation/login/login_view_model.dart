import 'package:flutter/cupertino.dart';
import 'package:sesac_ton/core/result.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/model/member/login/login_info.dart';
import '../../data/repository/member_repository/member_repository.dart';

class LoginViewModel with ChangeNotifier {
  final MemberRepository _memberRepository;

  LoginViewModel(this._memberRepository);

  bool _successLogin = false;
  String _errorMessage = '';
  String idValue = '';
  String passwordValue = '';

  bool get successLogin => _successLogin;

  String get errorMessage => _errorMessage;

  Future<void> loginUser() async {
    final result = await _memberRepository.loginUser(
      LoginInfo(
        id: idValue,
        password: passwordValue,
      ),
    );

    switch (result) {
      case Success():
        _successLogin = true;
        _errorMessage = '';
        await _saveLoginInfo(idValue, passwordValue);
        notifyListeners();
      case Error(:final e):
        _successLogin = false;
        _errorMessage = 'Login failed: $e';
        notifyListeners();
    }
  }

  Future<void> _saveLoginInfo(String id, String password) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userId', id);
    await prefs.setString('userPassword', password);
  }

  Future<void> tryAutoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    final id = prefs.getString('userId');
    final password = prefs.getString('userPassword');
    if (id != null && password != null) {
      idValue = id;
      passwordValue = password;
      await loginUser();
    }
  }
}

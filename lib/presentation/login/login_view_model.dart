import 'package:flutter/cupertino.dart';
import 'package:sesac_ton/core/result.dart';

import '../../data/model/member/login/login_info.dart';
import '../../data/repository/member_repository/member_repository.dart';
import '../../util/platform.dart';

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
        fcmKey: 'fcmKey',
        deviceOs: osInfo,
      ),
    );

    switch (result) {
      case Success(:final data):
        _successLogin = true;
        _errorMessage = '';
        notifyListeners();
      case Error(:final e):
        _successLogin = false;
        _errorMessage = 'Login failed: $e';
        notifyListeners();
    }
  }
}

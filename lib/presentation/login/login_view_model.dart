import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:sesac_ton/core/result.dart';
import 'package:sesac_ton/data/data_source/member_data_source/member_data_source_impl.dart';
import 'package:sesac_ton/data/repository/member_repository/member_repository_impl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/model/member/login/login_info.dart';
import '../../data/repository/member_repository/member_repository.dart';
import '../../util/network.dart';
import '../../util/platform.dart';

class LoginViewModel with ChangeNotifier {
  late final MemberRepository _memberRepository;

  LoginViewModel() {
    final loginDatasource = MemberDataSourceImpl();
    _memberRepository = MemberRepositoryImpl(loginDatasource);
  }

  bool _successLogin = false;
  String _errorMessage = '';

  bool get successLogin => _successLogin;

  String get errorMessage => _errorMessage;

  Future<void> loginUser(String id, String password) async {
    final result = await _memberRepository.loginUser(
      LoginInfo(
        id: id,
        password: password,
        fcmKey: 'fcmKey',
        deviceOs: osInfo,
      ),
    );

    switch (result) {
      case Success(:final data):
      // 로그인 성공 시 로그인 정보 저장
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('username', id);
        await prefs.setString('password', password);

        _successLogin = true;
        _errorMessage = '';
        notifyListeners();
        print('success');
      case Error(:final e):
        _successLogin = false;
        _errorMessage = 'Login failed: $e';
        notifyListeners();
    }
  }
}

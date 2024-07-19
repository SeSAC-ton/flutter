import 'package:flutter/cupertino.dart';
import 'package:sesac_ton/core/result.dart';
import 'package:sesac_ton/data/model/member/register/register_info.dart';

import '../../data/repository/member_repository/member_repository.dart';

class RegisterViewModel with ChangeNotifier {
  final MemberRepository _memberRepository;

  RegisterViewModel(this._memberRepository);

  String idValue = '';
  String passwordValue = '';
  String passwordCheckValue = '';
  String nameValue = '';

  String _registerErrorMessage = '';
  String _checkUserIdErrorMessage = '';

  String get errorMessage => _registerErrorMessage;

  String get checkUserIdErrorMessage => _checkUserIdErrorMessage;

  Future<void> registerUser() async {
    final result = await _memberRepository.registerUser(
      RegisterInfo(
        id: idValue,
        password: passwordValue,
        passwordCheck: passwordCheckValue,
        name: nameValue,
      ),
    );

    switch (result) {
      case Success(:final data):
        _registerErrorMessage = '';
        notifyListeners();
      case Error(:final e):
        _registerErrorMessage = 'Register failed: $e';
        notifyListeners();
    }
  }

  Future<void> checkUserId(String id) async {
    final result = await _memberRepository.checkUserId(id);
    switch (result) {
      case Success(:final data):
        _checkUserIdErrorMessage = '';
        notifyListeners();
      case Error(:final e):
        _checkUserIdErrorMessage = e;
        notifyListeners();
    }
  }
}

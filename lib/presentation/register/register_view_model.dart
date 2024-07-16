import 'package:flutter/cupertino.dart';
import 'package:sesac_ton/core/result.dart';
import 'package:sesac_ton/data/model/member/register/register_info.dart';

import '../../data/data_source/member_data_source/member_data_source_impl.dart';
import '../../data/repository/member_repository/member_repository.dart';
import '../../data/repository/member_repository/member_repository_impl.dart';

class RegisterViewModel with ChangeNotifier {
  late final MemberRepository _memberRepository;

  RegisterViewModel() {
    final loginDatasource = MemberDataSourceImpl();
    _memberRepository = MemberRepositoryImpl(loginDatasource);
  }

  String _registerErrorMessage = '';
  String _checkUserIdErrorMessage = '';

  String get errorMessage => _registerErrorMessage;
  String get checkUserIdErrorMessage => _checkUserIdErrorMessage;

  Future<void> registerUser(RegisterInfo registerInfo) async {
    final result = await _memberRepository.registerUser(registerInfo);

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

import 'package:flutter/cupertino.dart';
import 'package:sesac_ton/data/model/member/user_info.dart';
import 'package:sesac_ton/data/repository/member_repository/member_repository.dart';
import 'package:sesac_ton/util/network.dart';

import '../../core/result.dart';

class HomeViewModel with ChangeNotifier {
  final MemberRepository _memberRepository;

  HomeViewModel(this._memberRepository) {
    getUserName();
  }

  bool _isLoading = true;
  String _errorMessage = '';

  bool get isLoading => _isLoading;

  String get errorMessage => _errorMessage;

  Future<void> getUserName() async {
    _isLoading = true;
    notifyListeners();

    final result = await _memberRepository.getUserName();
    switch (result) {
      case Success(:final data):
        _isLoading = false;
        userName = data.name;
        birth = data.birth;
        _errorMessage = '';
        notifyListeners();
      case Error(:final e):
        _isLoading = true;
        _errorMessage = 'get UserName failed: $e';
        notifyListeners();
    }
  }
}

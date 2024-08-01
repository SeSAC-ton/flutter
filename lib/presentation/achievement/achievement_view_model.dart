import 'package:flutter/material.dart';
import 'package:sesac_ton/data/model/profile/achievement.dart';

import '../../core/result.dart';
import '../../data/repository/profile_repository/profile_repository.dart';

class AchievementViewModel with ChangeNotifier {
  final ProfileRepository _profileRepository;

  AchievementViewModel(this._profileRepository) {
    getAchievements();
  }

  bool _isLoading = true;
  String _errorMessage = '';

  List<Achievement> achievements = List.empty();

  bool get isLoading => _isLoading;

  String get errorMessage => _errorMessage;

  Future<void> getAchievements() async {
    _isLoading = true;
    notifyListeners();

    final result = await _profileRepository.getAchievements();
    switch (result) {
      case Success(:final data):
        _isLoading = false;
        _errorMessage = '';
        achievements = data;
        notifyListeners();
      case Error(:final e):
        _isLoading = true;
        _errorMessage = 'get Achievement failed: $e';
        notifyListeners();
    }
  }
}

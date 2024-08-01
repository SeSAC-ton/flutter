import 'package:flutter/cupertino.dart';
import 'package:sesac_ton/data/model/profile/solved_worksheet.dart';
import 'package:sesac_ton/data/repository/profile_repository/profile_repository.dart';

import '../../core/result.dart';

class SolvedWorksheetViewModel with ChangeNotifier {
  final ProfileRepository _profileRepository;

  SolvedWorksheetViewModel(this._profileRepository) {
    getSolvedWorkSheets();
  }

  bool _isLoading = true;
  String _errorMessage = '';

  List<SolvedWorksheet> worksheets = List.empty();

  bool get isLoading => _isLoading;

  String get errorMessage => _errorMessage;

  Future<void> getSolvedWorkSheets() async {
    _isLoading = true;
    notifyListeners();

    final result = await _profileRepository.getSolvedWorkSheets();
    switch (result) {
      case Success(:final data):
        _isLoading = false;
        _errorMessage = '';
        worksheets = data;
        notifyListeners();
      case Error(:final e):
        _isLoading = true;
        _errorMessage = 'get SolvedWorksheet failed: $e';
        notifyListeners();
    }
  }
}

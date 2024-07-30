import 'package:flutter/cupertino.dart';
import 'package:sesac_ton/data/model/worksheet/solve_problem.dart';

import '../../core/result.dart';
import '../../data/repository/worksheet_repository/worksheet_repository.dart';

class ProfileViewModel with ChangeNotifier {
  final WorksheetRepository _worksheetRepository;

  ProfileViewModel(this._worksheetRepository) {
    getSolveProblems();
  }

  bool _isLoading = true;
  String _errorMessage = '';

  bool get isLoading => _isLoading;

  String get errorMessage => _errorMessage;

  List<SolveProblem> _solveProblems = List.empty(growable: true);

  List<SolveProblem> get solveProblems => _solveProblems;

  Future<void> getSolveProblems() async {
    _isLoading = true;
    notifyListeners();

    final result = await _worksheetRepository.getSolveProblems();
    switch (result) {
      case Success(:final data):
        _solveProblems = data;
        _isLoading = false;
        _errorMessage = '';
        notifyListeners();
      case Error(:final e):
        _isLoading = true;
        _errorMessage = 'get Worksheet failed: $e';
        notifyListeners();
    }
  }
}

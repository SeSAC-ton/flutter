import 'package:flutter/cupertino.dart';
import 'package:sesac_ton/data/model/worksheet/problem.dart';
import 'package:sesac_ton/data/repository/worksheet_repository/worksheet_repository.dart';

import '../../core/result.dart';

class ProblemViewModel with ChangeNotifier {
  final WorksheetRepository _worksheetRepository;
  final int id;

  ProblemViewModel(this._worksheetRepository, this.id) {
    getProblem(id);
  }

  bool _isLoading = true;
  String _errorMessage = '';
  Problem explain =
      const Problem(title: 'title', content: 'content', options: []);

  bool get isLoading => _isLoading;

  String get errorMessage => _errorMessage;

  Future<void> getProblem(int id) async {
    _isLoading = true;
    notifyListeners();

    final result = await _worksheetRepository.getProblem(id);
    switch (result) {
      case Success(:final data):
        print(data);
        explain = data;
        _isLoading = false;
        _errorMessage = '';
        notifyListeners();
      case Error(:final e):
        _isLoading = true;
        _errorMessage = 'get Problem failed: $e';
        notifyListeners();
    }
  }

  Future<void> solveProblem(int id, int selectId) async {
    final result = await _worksheetRepository.solveProblem(id, selectId);
    switch (result) {
      case Success(:final data):
        _errorMessage = '';
        notifyListeners();
      case Error(:final e):
        _errorMessage = 'post solve Problem failed: $e';
        notifyListeners();
    }
  }
}

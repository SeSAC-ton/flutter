import 'package:flutter/cupertino.dart';
import 'package:sesac_ton/data/repository/worksheet_repository/worksheet_repository.dart';

import '../../core/result.dart';
import '../../data/model/worksheet/problem.dart';

class FootPrintViewModel with ChangeNotifier {
  final WorksheetRepository _worksheetRepository;
  final int id;

  FootPrintViewModel(
    this._worksheetRepository,
    this.id,
  ) {
    getProblem(id);
  }

  Problem foorPrint =
      const Problem(title: 'title', content: 'content', options: []);
  bool _isLoading = true;
  String _errorMessage = '';

  bool get isLoading => _isLoading;


  String get errorMessage => _errorMessage;

  Future<void> getProblem(int id) async {
    _isLoading = true;
    notifyListeners();

    final result = await _worksheetRepository.getProblem(id);
    switch (result) {
      case Success(:final data):
        foorPrint = data;
        _isLoading = false;
        _errorMessage = '';
        notifyListeners();
      case Error(:final e):
        _isLoading = true;
        _errorMessage = 'get Problem failed: $e';
        notifyListeners();
    }
  }
}

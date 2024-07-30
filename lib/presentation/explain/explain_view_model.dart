import 'package:flutter/cupertino.dart';
import 'package:sesac_ton/data/repository/worksheet_repository/worksheet_repository.dart';

import '../../core/result.dart';
import '../../data/model/worksheet/explain.dart';

class ExplainViewModel with ChangeNotifier {
  final WorksheetRepository _worksheetRepository;
  final int id;

  ExplainViewModel(this._worksheetRepository, this.id) {
    getExplain(id);
  }

  bool _isLoading = true;
  String _errorMessage = '';

  bool get isLoading => _isLoading;

  Explain explain = const Explain(title: 'title', content: 'content');

  String get errorMessage => _errorMessage;

  Future<void> getExplain(int id) async {
    _isLoading = true;
    notifyListeners();

    final result = await _worksheetRepository.getExplain(id);
    switch (result) {
      case Success(:final data):
        explain = data;
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

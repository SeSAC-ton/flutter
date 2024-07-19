import 'package:flutter/cupertino.dart';
import 'package:sesac_ton/core/result.dart';
import 'package:sesac_ton/data/model/worksheet/worksheet_title.dart';
import 'package:sesac_ton/data/repository/worksheet_repository/worksheet_repository.dart';

class WorksheetViewModel with ChangeNotifier {
  final WorksheetRepository _worksheetRepository;

  WorksheetViewModel(this._worksheetRepository) {
    getWorksheets();
  }

  String _errorMessage = '';

  String get errorMessage => _errorMessage;

  List<WorksheetTitle> _worksheets = List.empty(growable: true);

  List<WorksheetTitle> get worksheets => _worksheets;

  Future<void> getWorksheets() async {
    final result = await _worksheetRepository.getWorksheets();
    switch (result) {
      case Success(:final data):
        _worksheets = data;
        _errorMessage = '';
        notifyListeners();
      case Error(:final e):
        _errorMessage = 'Login failed: $e';
        notifyListeners();
    }
  }
}

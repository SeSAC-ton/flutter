import 'package:flutter/cupertino.dart';
import 'package:sesac_ton/core/result.dart';
import 'package:sesac_ton/data/model/worksheet/worksheet.dart';
import 'package:sesac_ton/data/repository/worksheet_repository/worksheet_repository.dart';

class WorksheetViewModel with ChangeNotifier {
  final WorksheetRepository _worksheetRepository;

  WorksheetViewModel(this._worksheetRepository) {
    getWorksheets();
  }
  bool _isLoading = true;
  String _errorMessage = '';
  bool get isLoading => _isLoading;

  String get errorMessage => _errorMessage;

  List<Worksheet> _worksheets = List.empty(growable: true);

  List<Worksheet> get worksheets => _worksheets;

  Future<void> getWorksheets() async {
    _isLoading = true;
    notifyListeners();

    final result = await _worksheetRepository.getWorksheets();
    switch (result) {
      case Success(:final data):
        print(data);
        _worksheets = data;
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

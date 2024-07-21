import 'package:sesac_ton/core/result.dart';
import 'package:sesac_ton/data/data_source/worksheet_data_source/worksheet_data_source.dart';
import 'package:sesac_ton/data/model/worksheet/explain.dart';
import 'package:sesac_ton/data/model/worksheet/problem.dart';
import 'package:sesac_ton/data/model/worksheet/worksheet.dart';

import 'worksheet_repository.dart';

class WorksheetRepositoryImpl implements WorksheetRepository {
  final WorksheetDataSource worksheetDataSource;

  WorksheetRepositoryImpl(this.worksheetDataSource);

  @override
  Future<Result<List<Worksheet>>> getWorksheets() async {
    try {
      final worksheets = await worksheetDataSource.getWorksheets();
      print('repo: $worksheets');
      return Result.success(worksheets);
    } catch (e) {
      return Result.error(e.toString());
    }
  }

  @override
  Future<Result<Explain>> getExplain(int id) async {
    try {
      final explain = await worksheetDataSource.getExplain(id);
      return Result.success(explain);
    } catch (e) {
      return Result.error(e.toString());
    }
  }

  @override
  Future<Result<Problem>> getProblem(int id) async {
    try {
      final problem = await worksheetDataSource.getProblem(id);
      return Result.success(problem);
    } catch (e) {
      print(e);
      return Result.error(e.toString());
    }
  }

  @override
  Future<Result<void>> solveProblem(int id, int selectId) async {
    try {
      final result = await worksheetDataSource.solveProblem(id, selectId);
      return Result.success(result);
    } catch (e) {
      print(e);
      return Result.error(e.toString());
    }
  }
}


import 'package:sesac_ton/data/model/worksheet/explain.dart';
import 'package:sesac_ton/data/model/worksheet/problem.dart';
import 'package:sesac_ton/data/model/worksheet/solve_problem.dart';

import '../../../core/result.dart';
import '../../model/worksheet/worksheet.dart';

abstract interface class WorksheetRepository {
  Future<Result<List<Worksheet>>> getWorksheets();
  Future<Result<Explain>> getExplain(int id);
  Future<Result<Problem>> getProblem(int id);
  Future<Result<void>> solveProblem(int id, int selectId);
  Future<Result<List<SolveProblem>>> getSolveProblems();
}
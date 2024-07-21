
import 'package:sesac_ton/data/model/worksheet/problem.dart';

import '../../model/worksheet/explain.dart';
import '../../model/worksheet/worksheet.dart';

abstract interface class WorksheetDataSource {
  Future<List<Worksheet>> getWorksheets();
  Future<Explain> getExplain(int id);
  Future<Problem> getProblem(int id);
  Future<void> solveProblem(int id, int selectId);
}
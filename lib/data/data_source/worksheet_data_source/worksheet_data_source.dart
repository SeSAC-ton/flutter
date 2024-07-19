
import 'package:sesac_ton/data/model/worksheet/worksheet.dart';

import '../../../core/result.dart';
import '../../model/worksheet/worksheet_title.dart';

abstract interface class WorksheetDataSource {
  Future<Result<List<WorksheetTitle>>> getWorksheets();
}
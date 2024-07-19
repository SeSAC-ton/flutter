import 'package:sesac_ton/core/result.dart';
import 'package:sesac_ton/data/data_source/worksheet_data_source/worksheet_data_source.dart';
import 'package:sesac_ton/data/model/worksheet/worksheet_title.dart';

import 'worksheet_repository.dart';

class WorksheetRepositoryImpl implements WorksheetRepository {
  final WorksheetDataSource worksheetDataSource;

  WorksheetRepositoryImpl(this.worksheetDataSource);

  @override
  Future<Result<List<WorksheetTitle>>> getWorksheets() =>
      worksheetDataSource.getWorksheets();
}

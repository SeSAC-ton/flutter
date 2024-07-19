
import 'package:sesac_ton/data/model/member/register/register_info.dart';

import '../../../core/result.dart';
import '../../model/member/login/login_info.dart';
import '../../model/worksheet/worksheet_title.dart';

abstract interface class WorksheetRepository {
  Future<Result<List<WorksheetTitle>>> getWorksheets();
}
import 'package:sesac_ton/data/model/profile/achievement.dart';

import '../../../core/result.dart';
import '../../model/profile/solved_worksheet.dart';

abstract interface class ProfileRepository {
  Future<Result<List<Achievement>>> getAchievements();

  Future<Result<List<SolvedWorksheet>>> getSolvedWorkSheets();
}

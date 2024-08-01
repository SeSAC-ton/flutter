
import 'package:sesac_ton/data/model/member/user_info.dart';
import 'package:sesac_ton/data/model/profile/achievement.dart';
import 'package:sesac_ton/data/model/profile/solved_worksheet.dart';

import '../../../core/result.dart';
import '../../model/member/login/login_info.dart';
import '../../model/member/register/register_info.dart';
import '../../model/worksheet/problem.dart';

abstract interface class ProfileDataSource {
  Future<List<SolvedWorksheet>> getSolvedWorkSheets();
  Future<List<Achievement>> getAchievements();
}
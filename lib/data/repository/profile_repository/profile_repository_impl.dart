import 'package:sesac_ton/core/result.dart';
import 'package:sesac_ton/data/data_source/profile_data_source/profile_data_source.dart';

import 'package:sesac_ton/data/model/profile/achievement.dart';

import 'package:sesac_ton/data/model/profile/solved_worksheet.dart';

import 'profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  ProfileDataSource profileDataSource;

  ProfileRepositoryImpl(this.profileDataSource);

  @override
  Future<Result<List<Achievement>>> getAchievements() async {
    try {
      final achievements = await profileDataSource.getAchievements();
      return Result.success(achievements);
    } catch (e) {
      return Result.error(e.toString());
    }
  }

  @override
  Future<Result<List<SolvedWorksheet>>> getSolvedWorkSheets() async {
    try {
      final solvedWorksheets = await profileDataSource.getSolvedWorkSheets();
      print(solvedWorksheets);
      return Result.success(solvedWorksheets);
    } catch (e) {
      print(e);
      return Result.error(e.toString());
    }
  }
}

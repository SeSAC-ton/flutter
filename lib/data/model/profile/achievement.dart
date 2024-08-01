import 'package:freezed_annotation/freezed_annotation.dart';

part 'achievement.freezed.dart';

part 'achievement.g.dart';

@freezed
class Achievement with _$Achievement {
  const factory Achievement({
    required String title,
    required String subTitle,
    required bool isAttainment,
  }) = _Achievement;

  factory Achievement.fromJson(Map<String, Object?> json) =>
      _$AchievementFromJson(json);
}

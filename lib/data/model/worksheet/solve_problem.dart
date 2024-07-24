import 'package:freezed_annotation/freezed_annotation.dart';

part 'solve_problem.freezed.dart';

part 'solve_problem.g.dart';

@freezed
class SolveProblem with _$SolveProblem {
  const factory SolveProblem({
    required String solvedWorksheetTitle,
    required int solvedWorksheetId,
  }) = _SolveProblem;

  factory SolveProblem.fromJson(Map<String, Object?> json) =>
      _$SolveProblemFromJson(json);
}

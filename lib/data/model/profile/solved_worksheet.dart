import 'package:freezed_annotation/freezed_annotation.dart';

part 'solved_worksheet.freezed.dart';

part 'solved_worksheet.g.dart';

@freezed
class SolvedWorksheet with _$SolvedWorksheet {
  const factory SolvedWorksheet({
    required String solvedWorksheetTitle,
    required int solvedWorksheetId,
    required bool isCorrect,
  }) = _SolvedWorksheet;

  factory SolvedWorksheet.fromJson(Map<String, Object?> json) =>
      _$SolvedWorksheetFromJson(json);
}

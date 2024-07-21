import 'package:freezed_annotation/freezed_annotation.dart';

part 'worksheet.freezed.dart';

part 'worksheet.g.dart';

@freezed
class Worksheet with _$Worksheet {
  const factory Worksheet({
    required String id,
    required String category,
    required String title,
  }) = _Worksheet;

  factory Worksheet.fromJson(Map<String, Object?> json) => _$WorksheetFromJson(json);
}
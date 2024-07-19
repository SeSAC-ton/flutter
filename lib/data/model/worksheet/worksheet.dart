import 'package:freezed_annotation/freezed_annotation.dart';

part 'worksheet.freezed.dart';

part 'worksheet.g.dart';

@freezed
class Worksheet with _$Worksheet {
  const factory Worksheet({
    @JsonKey(name: 'worksheet_title') required String title,
    @JsonKey(name: 'worksheet_finger_print') required String fingerPrint,
    @JsonKey(name: 'worksheet_choices') required List<String> choices,
    @JsonKey(name: 'worksheet_answer_idx') required int answerIdx,
  }) = _Worksheet;

  factory Worksheet.fromJson(Map<String, Object?> json) => _$WorksheetFromJson(json);
}
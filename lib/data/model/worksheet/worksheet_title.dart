import 'package:freezed_annotation/freezed_annotation.dart';

part 'worksheet_title.freezed.dart';

part 'worksheet_title.g.dart';

@freezed
class WorksheetTitle with _$WorksheetTitle {
  const factory WorksheetTitle({
    @JsonKey(name: 'worksheet_idx') required int idx,
    @JsonKey(name: 'worksheet_title') required String title,
    @JsonKey(name: 'worksheet_category') required String category,
  }) = _WorksheetTitle;

  factory WorksheetTitle.fromJson(Map<String, Object?> json) =>
      _$WorksheetTitleFromJson(json);
}

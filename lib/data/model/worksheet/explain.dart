import 'package:freezed_annotation/freezed_annotation.dart';

part 'explain.freezed.dart';

part 'explain.g.dart';

@freezed
class Explain with _$Explain {
  const factory Explain({
    required String title,
    required String content,
  }) = _Explain;

  factory Explain.fromJson(Map<String, Object?> json) => _$ExplainFromJson(json);
}
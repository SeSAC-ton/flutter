import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sesac_ton/data/model/worksheet/option.dart';

part 'problem.freezed.dart';

part 'problem.g.dart';

@freezed
class Problem with _$Problem {
  const factory Problem({
    required String title,
    required String content,
    required List<Option> options
  }) = _Problem;

  factory Problem.fromJson(Map<String, Object?> json) => _$ProblemFromJson(json);
}
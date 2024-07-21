import 'package:freezed_annotation/freezed_annotation.dart';

part 'option.freezed.dart';

part 'option.g.dart';

@freezed
class Option with _$Option {
  const factory Option({
    required int id,
    required String name,
    required bool isAnswer,
  }) = _Option;

  factory Option.fromJson(Map<String, Object?> json) => _$OptionFromJson(json);
}
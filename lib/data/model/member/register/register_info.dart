import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_info.freezed.dart';

part 'register_info.g.dart';

@freezed
class RegisterInfo with _$RegisterInfo {
  const factory RegisterInfo({
    @JsonKey(name: 'member_id') required String id,
    @JsonKey(name: 'member_pw') required String password,
    @JsonKey(name: 'member_pw_confirm') required String passwordCheck,
    @JsonKey(name: 'member_name') required String name,
  }) = _RegisterInfo;

  factory RegisterInfo.fromJson(Map<String, Object?> json) =>
      _$RegisterInfoFromJson(json);
}

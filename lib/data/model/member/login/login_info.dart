import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_info.freezed.dart';
part 'login_info.g.dart';

@freezed
class LoginInfo with _$LoginInfo {
  const factory LoginInfo({
    @JsonKey(name: 'member_id')
    required String id,
    @JsonKey(name: 'member_pw')
    required String password,
    @JsonKey(name: 'gcm_key')
    required String fcmKey,
    @JsonKey(name: 'device_os')
    required String deviceOs,

  }) = _LoginInfo;

  factory LoginInfo.fromJson(Map<String, Object?> json) => _$LoginInfoFromJson(json);
}
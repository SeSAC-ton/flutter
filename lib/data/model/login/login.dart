import 'package:freezed_annotation/freezed_annotation.dart';

part 'login.freezed.dart';

part 'login.g.dart';

@freezed
class Login with _$Login {
  const factory Login({
    @JsonKey(name: 'member_id')
    required String id,
    @JsonKey(name: 'member_pw')
    required String password,
    @JsonKey(name: 'gcm_key')
    required String fcmKey,
    @JsonKey(name: 'device_os')
    required String deviceOs,
  }) = _Login;

  factory Login.fromJson(Map<String, Object?> json) => _$LoginFromJson(json);
}
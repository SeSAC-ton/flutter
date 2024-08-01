import 'package:sesac_ton/data/model/member/register/register_info.dart';

import '../../../core/result.dart';
import '../../model/member/login/login_info.dart';
import '../../model/member/user_info.dart';

abstract interface class MemberRepository {
  Future<Result<void>> loginUser(LoginInfo loginInfo);

  Future<Result<void>> registerUser(RegisterInfo registerInfo);

  Future<Result<void>> checkUserId(String id);

  Future<Result<UserInfo>> getUserName();
}

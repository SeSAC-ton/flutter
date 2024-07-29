
import '../../../core/result.dart';
import '../../model/member/login/login_info.dart';
import '../../model/member/register/register_info.dart';

abstract interface class MemberDataSource {
  Future<Result<void>> loginUser(LoginInfo loginInfo);
  Future<Result<void>> registerUser(RegisterInfo registerInfo);
  Future<Result<void>> checkUserId(String id);
  Future<Result<String>> getUserName();
}
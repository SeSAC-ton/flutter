import 'package:sesac_ton/data/data_source/member_data_source/member_data_source.dart';
import 'package:sesac_ton/data/model/member/register/register_info.dart';

import '../../../core/result.dart';
import '../../model/member/login/login_info.dart';
import 'member_repository.dart';

class MemberRepositoryImpl implements MemberRepository {
  final MemberDataSource memberDataSource;

  MemberRepositoryImpl(this.memberDataSource);

  @override
  Future<Result<void>> loginUser(LoginInfo loginInfo) => memberDataSource.loginUser(loginInfo);

  @override
  Future<Result<void>> registerUser(RegisterInfo registerInfo) => memberDataSource.registerUser(registerInfo);

  @override
  Future<Result<void>> checkUserId(String id) => memberDataSource.checkUserId(id);

  @override
  Future<Result<String>> getUserName() => memberDataSource.getUserName();
}

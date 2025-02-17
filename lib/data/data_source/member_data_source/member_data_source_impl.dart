import 'dart:convert';

import 'package:sesac_ton/data/model/member/register/register_info.dart';
import 'package:sesac_ton/data/model/member/user_info.dart';
import 'package:sesac_ton/util/network.dart';

import '../../../core/result.dart';
import '../../model/member/login/login_info.dart';
import 'member_data_source.dart';
import 'package:http/http.dart' as http;

class MemberDataSourceImpl implements MemberDataSource {
  @override
  Future<Result<void>> loginUser(LoginInfo loginInfo) async {
    const url = '$baseUrl/login_v_1_0_0/loginUser';

    print(jsonEncode(loginInfo.toJson()));
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(loginInfo.toJson()),
      );


      print(response.statusCode);
      if (response.statusCode != 200) {
        return Result.error(jsonDecode(response.body)['code_msg']);
      }

      final result = jsonDecode(response.body);
      // member_idx 값 넣어주기 필요.
      print(result);
      memberIdx = int.parse(result['member_idx']);
      userName = result['member_name'];
      return Result.success(result);
    } catch (e) {
      return Result.error(e.toString());
    }
  }

  @override
  Future<Result<void>> registerUser(RegisterInfo registerInfo) async {
    const url = '$baseUrl/register_v_1_0_0/registerUser';

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(registerInfo.toJson()),
      );

      if (response.statusCode != 200) {
        print(Result.error(jsonDecode(response.body)['code_msg']));
        return Result.error(jsonDecode(response.body)['code_msg']);
      }

      final result = jsonDecode(response.body);
      return Result.success(result);
    } catch (e) {
      return Result.error(e.toString());
    }
  }

  @override
  Future<Result<void>> checkUserId(String id) async {
    const url = '$baseUrl/register_v_1_0_0/checkUserId';
    final json = {'member_id : $id'};

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(json),
      );

      if (response.statusCode != 200) {
        print(Result.error(jsonDecode(response.body)['code_msg']));
        return Result.error(jsonDecode(response.body)['code_msg']);
      }

      final result = jsonDecode(response.body);
      return Result.success(result);
    } catch (e) {
      return Result.error(e.toString());
    }
  }

  @override
  Future<Result<UserInfo>> getUserName() async {
    const url = '$baseUrl/name_v_1_0_0/getUserName';
    try {
      final response = await http.get(
        Uri.parse(url).replace(
          queryParameters: {
            'memberId': '$memberIdx',
          },
        ),
      );

      if (response.statusCode != 200) {
        throw Exception(jsonDecode(response.body)['code_msg']);
      }

      final json = jsonDecode(response.body);
      final result = UserInfo.fromJson(json);
      return Result.success(result);
    } catch (e) {
      return Result.error(e.toString());
    }
  }
}

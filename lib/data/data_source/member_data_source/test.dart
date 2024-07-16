import 'dart:io';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../model/member/login/login_info.dart';
import 'member_data_source.dart';

class Test {
  Future<void> testApi() async {
    const url = 'http://api.sesac.sunghunaaa.store/login_v_1_0_0/loginUser';
    const urlAdmin = 'http://api.sesac.sunghunaaa.store/login_v_1_0_0/loginAdmin';

    String osInfo = (!Platform.isIOS) ? 'A' : 'I';
    final user = LoginInfo(
      id: 'test@naver.com',
      password: 'eqwewq',
      fcmKey: '',
      deviceOs: osInfo,
    );

    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(user.toJson()),
    );

    final urlAdminWithParameter = Uri.parse(urlAdmin).replace(queryParameters: {
      'member_idx': '1',
    });

    final responseWithAdmin = await http.get(urlAdminWithParameter);


    // if (response.statusCode != 200) throw Exception('response statusCode not 200');


    // print(jsonDecode(response.body)['code_msg']);
    // print('Response status: ${response.statusCode}');
    // print('Response body: ${response.body}');
    // print('Response body: ${jsonDecode(response.body)}');
    print('Response status: ${responseWithAdmin.statusCode}');
    print('Response body: ${responseWithAdmin.body}');
    print('Response body: ${jsonDecode(responseWithAdmin.body)}');

  }
}

void main() async {
  final data = Test();
  data.testApi();
}

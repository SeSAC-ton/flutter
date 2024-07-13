import 'dart:io';

import 'package:dio/dio.dart';

import '../../model/login/login.dart';
import 'register_data_source.dart';

class RegisterDataSourceImpl implements RegisterDataSource {
  @override
  Future<void> testApi() async {
    const url = 'http://api.sesac.sunghunaaa.store/login_v_1_0_0/loginUser';

    String osInfo = (Platform.isAndroid) ? 'A' : 'I';
    final user = Login(
        id: 'test@naver.com', password: 'eqwewq', fcmKey: '', deviceOs: osInfo);

    final temp = FormData.fromMap(user.toJson());
    final response = await Dio().post(url, data: temp);
    print(response);
  }
}

void main() async {
  final data = RegisterDataSourceImpl();

  data.testApi();
}

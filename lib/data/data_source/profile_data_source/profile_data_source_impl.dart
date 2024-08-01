import 'dart:convert';

import 'package:sesac_ton/data/model/profile/achievement.dart';

import 'package:sesac_ton/data/model/profile/solved_worksheet.dart';
import 'package:http/http.dart' as http;

import '../../../util/network.dart';
import 'profile_data_source.dart';

class ProfileDataSourceImpl implements ProfileDataSource {
  @override
  Future<List<Achievement>> getAchievements() async {
    const url = '$baseUrl/achievement_v_1_0_0/getAchievements';

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

      final List jsonList = jsonDecode(response.body);
      return jsonList.map((e) => Achievement.fromJson(e)).toList();
    } catch (e) {
      throw Exception('datasource error');
    }
  }

  @override
  Future<List<SolvedWorksheet>> getSolvedWorkSheets() async {
    const url = '$baseUrl/profile_v_1_0_0/getProfile';

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

      final List jsonList = jsonDecode(response.body);
      return jsonList.map((e) => SolvedWorksheet.fromJson(e)).toList();
    } catch (e) {
      throw Exception('datasource error');
    }
  }
}

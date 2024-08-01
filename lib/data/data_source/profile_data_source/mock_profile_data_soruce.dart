import 'dart:convert';

import 'package:sesac_ton/data/model/profile/achievement.dart';

import 'package:sesac_ton/data/model/profile/solved_worksheet.dart';
import 'package:http/http.dart' as http;

import '../../../util/network.dart';
import 'profile_data_source.dart';

class MockProfileDataSoruce implements ProfileDataSource {
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
    // 각 Worksheet의 제목, ID, 그리고 정답 여부를 SolvedWorksheet 리스트에 추가
    return [
      const SolvedWorksheet(
        solvedWorksheetTitle: '건강한 식단 만들기',
        solvedWorksheetId: 1,
        isCorrect: true,
      ),
      const SolvedWorksheet(
        solvedWorksheetTitle: '운동 루틴 만들기',
        solvedWorksheetId: 2,
        isCorrect: false,
      ),
      const SolvedWorksheet(
        solvedWorksheetTitle: '시간 관리 방법',
        solvedWorksheetId: 3,
        isCorrect: true,
      ),
      const SolvedWorksheet(
        solvedWorksheetTitle: '스트레스 관리',
        solvedWorksheetId: 4,
        isCorrect: false,
      ),
      const SolvedWorksheet(
        solvedWorksheetTitle: '사회 규칙 이해하기',
        solvedWorksheetId: 5,
        isCorrect: true,
      ),
      const SolvedWorksheet(
        solvedWorksheetTitle: '지역사회 활동 참여하기',
        solvedWorksheetId: 6,
        isCorrect: true,
      ),
      const SolvedWorksheet(
        solvedWorksheetTitle: '온라인 예절',
        solvedWorksheetId: 7,
        isCorrect: true,
      ),
      const SolvedWorksheet(
        solvedWorksheetTitle: '금융 관리',
        solvedWorksheetId: 8,
        isCorrect: false,
      ),
      const SolvedWorksheet(
        solvedWorksheetTitle: '친구 사귀기',
        solvedWorksheetId: 9,
        isCorrect: true,
      ),
      const SolvedWorksheet(
        solvedWorksheetTitle: '의사소통 기술',
        solvedWorksheetId: 10,
        isCorrect: true,
      ),
    ];
  }
}

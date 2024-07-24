import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sesac_ton/data/model/worksheet/explain.dart';
import 'package:sesac_ton/data/model/worksheet/problem.dart';
import 'package:sesac_ton/util/network.dart';

import '../../model/worksheet/solve_problem.dart';
import '../../model/worksheet/worksheet.dart';
import 'worksheet_data_source.dart';

class WorksheetDataSourceImpl implements WorksheetDataSource {
  @override
  Future<List<Worksheet>> getWorksheets() async {
    const url = '$baseUrl/worksheet_v_1_0_0/getWorksheets';

    try {
      final response = await http.get(
        Uri.parse(url).replace(
          queryParameters: {
            'member_idx': '$memberIdx',
          },
        ),
      );

      if (response.statusCode != 200) {
        throw Exception(jsonDecode(response.body)['code_msg']);
      }

      final List jsonList = jsonDecode(response.body);
      return jsonList.map((e) => Worksheet.fromJson(e)).toList();
    } catch (e) {
      throw Exception('datasource error');
    }
  }

  @override
  Future<Explain> getExplain(int id) async {
    const url = '$baseUrl/worksheet_v_1_0_0/getExplain';

    try {
      final response = await http.get(
        Uri.parse(url).replace(
          queryParameters: {
            'worksheetId': '$id',
          },
        ),
      );

      if (response.statusCode != 200) {
        throw Exception(jsonDecode(response.body)['code_msg']);
      }

      final json = jsonDecode(response.body);
      return Explain.fromJson(json);
    } catch (e) {
      throw Exception('datasource error');
    }
  }

  @override
  Future<Problem> getProblem(int id) async {
    const url = '$baseUrl/worksheet_v_1_0_0/getWorksheetDetail';

    try {
      final response = await http.get(
        Uri.parse(url).replace(
          queryParameters: {
            'memberId': '$memberIdx',
            'worksheetId': '$id',
          },
        ),
      );

      if (response.statusCode != 200) {
        throw Exception(jsonDecode(response.body)['code_msg']);
      }

      final json = jsonDecode(response.body);
      return Problem.fromJson(json);
    } catch (e) {
      throw Exception('datasource error');
    }
  }

  @override
  Future<void> solveProblem(int id, int selectId) async {
    const url = '$baseUrl/worksheet_v_1_0_0/solveWorksheet';
    final json = {
      'memberId': '$memberIdx',
      'worksheetId': '$id',
      'selectId': '$selectId'
    };

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(json),
      );

      if (response.statusCode != 200) {
        throw Exception(jsonDecode(response.body)['code_msg']);
      }
    } catch (e) {
      throw Exception('datasource error');
    }
  }

  @override
  Future<List<SolveProblem>> getSolveProblems() async {
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
      return jsonList.map((e) => SolveProblem.fromJson(e)).toList();
    } catch (e) {
      throw Exception('datasource error');
    }
  }
}

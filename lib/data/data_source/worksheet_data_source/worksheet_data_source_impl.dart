import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sesac_ton/data/model/worksheet/worksheet.dart';
import 'package:sesac_ton/util/network.dart';

import '../../../core/result.dart';
import '../../model/worksheet/worksheet_title.dart';
import 'worksheet_data_source.dart';

class WorksheetDataSourceImpl implements WorksheetDataSource {
  @override
  Future<Result<List<WorksheetTitle>>> getWorksheets() async {
    const url = '$baseUrl/worksheet_v_1_0_0/getWorksheets';

    try {
      // final response = await http.get(
      //   Uri.parse(url).replace(
      //     queryParameters: {
      //       'member_idx': '$memberIdx',
      //     },
      //   ),
      // );
      //
      // if (response.statusCode != 200) {
      //   return Result.error(jsonDecode(response.body)['code_msg']);
      // }
      //
      // final result = jsonDecode(response.body);
      final mockData = [
        const WorksheetTitle(idx: 1, title: '퍼즐 맞추는 방법', category: '일상',),
        const WorksheetTitle(idx: 2, title: '대출 하는 방법', category: '금융',),
        const WorksheetTitle(idx: 3, title: '살아 가는 방법', category: '일상',),
        const WorksheetTitle(idx: 4, title: '코딩 하는 방법', category: '일상',),
        const WorksheetTitle(idx: 5, title: '집 사는 방법', category: '주거',),
      ];


      return Result.success(mockData);
    } catch (e) {
      return Result.error(e.toString());
    }
  }
}

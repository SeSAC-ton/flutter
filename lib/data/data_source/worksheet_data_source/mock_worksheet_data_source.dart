import 'dart:convert';

import 'package:sesac_ton/data/data_source/worksheet_data_source/worksheet_data_source.dart';
import 'package:sesac_ton/data/model/worksheet/explain.dart';
import 'package:sesac_ton/data/model/worksheet/problem.dart';
import 'package:sesac_ton/data/model/worksheet/solve_problem.dart';
import 'package:sesac_ton/data/model/worksheet/worksheet.dart';
import 'package:http/http.dart' as http;

import '../../../util/network.dart';
import '../../model/worksheet/option.dart';

class MockWorksheetDataSource implements WorksheetDataSource {
  @override
  Future<Explain> getExplain(int id) async {
    switch (id) {
      case 1:
        return const Explain(
          title: '건강한 식단 만들기',
          content: '건강한 식단을 만들기 위해서는 다양한 영양소를 균형 있게 섭취하는 것이 중요합니다. 채소, 과일, 통곡물, 그리고 단백질이 풍부한 음식을 포함하세요. 물도 충분히 마시고, 가공식품과 설탕 섭취를 줄이세요.',
        );
      case 2:
        return const Explain(
          title: '운동 루틴 만들기',
          content: '운동 루틴을 만들기 위해서는 먼저 운동 목표를 설정하세요. 일주일 동안 어떤 운동을 할지 계획하고, 각 운동의 시간을 정하세요. 유산소 운동, 근력 운동, 그리고 스트레칭을 포함하여 균형 잡힌 루틴을 만드세요.',
        );
      case 3:
        return const Explain(
          title: '시간 관리 방법',
          content: '효과적인 시간 관리를 위해 하루 일과를 계획하세요. 우선순위를 정하고, 중요한 일부터 처리하세요. 시간을 기록하고, 적절한 휴식 시간을 가지며 일의 효율을 높이세요.',
        );
      case 4:
        return const Explain(
          title: '스트레스 관리',
          content: '스트레스를 관리하기 위해서는 스트레스 원인을 파악하고, 깊은 호흡 운동을 시도해보세요. 요가나 명상을 통해 몸과 마음을 편안하게 하고, 취미 활동을 통해 즐거움을 찾으세요. 필요할 경우 전문 상담사의 도움을 받으세요.',
        );
      case 5:
        return const Explain(
          title: '사회 규칙 이해하기',
          content: '사회 규칙을 이해하기 위해서는 예의 바른 말투를 사용하고, 다른 사람의 말을 경청하는 것이 중요합니다. 공공장소에서의 예절을 지키고, 항상 다른 사람의 입장을 생각해보세요.',
        );
      case 6:
        return const Explain(
          title: '지역사회 활동 참여하기',
          content: '지역사회 활동에 참여하기 위해 자원봉사를 찾아보세요. 지역 행사에 참여하고, 새로운 사람을 만나며 공동체 활동에 적극적으로 참여하세요. 이는 사회적 유대감을 높이는 데 도움이 됩니다.',
        );
      case 7:
        return const Explain(
          title: '온라인 예절',
          content: '온라인 예절을 지키기 위해서는 예의 바르게 행동하고, 개인정보를 보호하세요. 부정적인 댓글을 피하고, 긍정적인 소통을 통해 온라인 상에서도 좋은 관계를 유지하세요.',
        );
      case 8:
        return const Explain(
          title: '금융 관리',
          content: '금융 관리를 위해 예산을 세우고, 저축 방법을 배워보세요. 지출을 기록하고, 자신의 재정을 체계적으로 관리하세요. 다양한 금융 상품을 이해하고, 자신에게 맞는 것을 선택하세요.',
        );
      case 9:
        return const Explain(
          title: '친구 사귀기',
          content: '친구를 사귀기 위해 먼저 인사하고, 공통 관심사를 찾아보세요. 대화를 이어가며 친해지고, 연락처를 교환하세요. 이를 통해 새로운 친구를 만들 수 있습니다.',
        );
      case 10:
        return const Explain(
          title: '의사소통 기술',
          content: '효과적인 의사소통을 위해 명확하게 말하고, 몸짓 언어를 이해하세요. 대화 중 질문을 하여 상대방의 말을 이해하고, 자신의 감정을 표현하는 법을 배우세요.',
        );
      default:
        return const Explain(
          title: '',
          content: '해당 ID에 대한 설명이 없습니다.',
        );
    }
  }


  @override
  Future<Problem> getProblem(int id) async {
    switch (id) {
      case 1:
        return const Problem(
          title: '건강한 식단 만들기',
          content: '건강한 식단을 위해서는 과일과 채소를 많이 먹는 것이 좋습니다. 패스트푸드나 가공식품, 설탕이 많이 든 음료는 피해야 합니다. 어떤 것이 건강한 식단을 위한 올바른 선택일까요?',
          options: [
            Option(id: 1, name: '과일과 채소', isAnswer: true),
            Option(id: 2, name: '패스트푸드', isAnswer: false),
            Option(id: 3, name: '가공식품', isAnswer: false),
            Option(id: 4, name: '설탕이 든 음료', isAnswer: false),
          ],
        );
      case 2:
        return const Problem(
          title: '운동 루틴 만들기',
          content: '운동 루틴을 만들 때 유산소 운동, 근력 운동, 그리고 스트레칭을 포함해야 합니다. TV 시청이나 간식 먹기, 게임하기는 운동 루틴에 포함되지 않습니다. 주간 운동 루틴에 포함되어야 할 것은 무엇일까요?',
          options: [
            Option(id: 1, name: '유산소 운동', isAnswer: true),
            Option(id: 2, name: 'TV 시청', isAnswer: false),
            Option(id: 3, name: '간식 먹기', isAnswer: false),
            Option(id: 4, name: '게임하기', isAnswer: false),
          ],
        );
      case 3:
        return const Problem(
          title: '시간 관리 방법',
          content: '시간을 잘 관리하려면 하루 일과를 계획하고, 중요한 일부터 처리하는 것이 중요합니다. 늦잠 자거나, SNS 하기는 시간 관리에 도움이 되지 않습니다. 시간 관리를 위해 가장 중요한 것은 무엇일까요?',
          options: [
            Option(id: 1, name: '우선순위 정하기', isAnswer: true),
            Option(id: 2, name: '늦잠 자기', isAnswer: false),
            Option(id: 3, name: '휴식 시간 가지기', isAnswer: false),
            Option(id: 4, name: 'SNS 하기', isAnswer: false),
          ],
        );
      case 4:
        return const Problem(
          title: '스트레스 관리',
          content: '스트레스를 줄이기 위해 깊은 호흡 운동이나 명상, 요가 등을 시도할 수 있습니다. 과식하거나, 과음하거나, 화내는 것은 스트레스 관리에 도움이 되지 않습니다. 스트레스를 관리하기 위해 시도할 수 있는 방법은 무엇일까요?',
          options: [
            Option(id: 1, name: '깊은 호흡 운동', isAnswer: true),
            Option(id: 2, name: '과식하기', isAnswer: false),
            Option(id: 3, name: '과음하기', isAnswer: false),
            Option(id: 4, name: '화내기', isAnswer: false),
          ],
        );
      case 5:
        return const Problem(
          title: '사회 규칙 이해하기',
          content: '사회에서 바르게 행동하려면 예의 바른 말투를 사용하고, 다른 사람의 말을 잘 들어야 합니다. 소리를 지르거나, 무시하거나, 다른 사람의 말을 끊는 것은 예의가 아닙니다. 사회에서 바른 예절은 무엇일까요?',
          options: [
            Option(id: 1, name: '예의 바른 말투 사용하기', isAnswer: true),
            Option(id: 2, name: '소리 지르기', isAnswer: false),
            Option(id: 3, name: '무시하기', isAnswer: false),
            Option(id: 4, name: '다른 사람 말 끊기', isAnswer: false),
          ],
        );
      case 6:
        return const Problem(
          title: '지역사회 활동 참여하기',
          content: '지역사회 활동에 참여하려면 자원봉사에 참여하거나, 지역 행사에 참여하는 것이 좋습니다. 집에만 있거나, 혼자 놀기, 모임을 회피하는 것은 도움이 되지 않습니다. 지역사회 활동에 참여하기 위한 방법은 무엇일까요?',
          options: [
            Option(id: 1, name: '자원봉사 참여하기', isAnswer: true),
            Option(id: 2, name: '집에만 있기', isAnswer: false),
            Option(id: 3, name: '혼자 놀기', isAnswer: false),
            Option(id: 4, name: '모임 회피하기', isAnswer: false),
          ],
        );
      case 7:
        return const Problem(
          title: '온라인 예절',
          content: '온라인에서 바르게 행동하려면 예의 바르게 행동하고, 개인정보를 잘 보호해야 합니다. 악성 댓글을 달거나, 개인정보를 유출하거나, 사기 행위를 하는 것은 옳지 않습니다. 온라인에서 바른 예절은 무엇일까요?',
          options: [
            Option(id: 1, name: '예의 바르게 행동하기', isAnswer: true),
            Option(id: 2, name: '악성 댓글 달기', isAnswer: false),
            Option(id: 3, name: '개인정보 유출하기', isAnswer: false),
            Option(id: 4, name: '사기 행위하기', isAnswer: false),
          ],
        );
      case 8:
        return const Problem(
          title: '금융 관리',
          content: '금융 관리를 잘 하려면 예산을 세우고, 저축을 하는 것이 중요합니다. 무계획 소비나, 과소비, 지출 기록을 하지 않는 것은 금융 관리에 도움이 되지 않습니다. 금융 관리를 위해 필요한 것은 무엇일까요?',
          options: [
            Option(id: 1, name: '예산 세우기', isAnswer: true),
            Option(id: 2, name: '무계획 소비', isAnswer: false),
            Option(id: 3, name: '과소비', isAnswer: false),
            Option(id: 4, name: '지출 기록 안 하기', isAnswer: false),
          ],
        );
      case 9:
        return const Problem(
          title: '친구 사귀기',
          content: '새로운 친구를 사귀려면 먼저 인사를 하고, 공통 관심사를 찾아보는 것이 좋습니다. 무시하거나, 혼자 있거나, 다른 사람을 비난하는 것은 친구를 사귀는 데 도움이 되지 않습니다. 새로운 친구를 사귀기 위해 필요한 것은 무엇일까요?',
          options: [
            Option(id: 1, name: '먼저 인사하기', isAnswer: true),
            Option(id: 2, name: '무시하기', isAnswer: false),
            Option(id: 3, name: '혼자 있기', isAnswer: false),
            Option(id: 4, name: '다른 사람 비난하기', isAnswer: false),
          ],
        );
      case 10:
        return const Problem(
          title: '의사소통 기술',
          content: '효과적으로 의사소통을 하려면 명확하게 말하고, 상대방의 말을 잘 들어야 합니다. 소리 지르거나, 말을 끊거나, 비난하는 것은 좋지 않습니다. 의사소통을 잘 하기 위해 중요한 것은 무엇일까요?',
          options: [
            Option(id: 1, name: '명확하게 말하기', isAnswer: true),
            Option(id: 2, name: '소리 지르기', isAnswer: false),
            Option(id: 3, name: '말 끊기', isAnswer: false),
            Option(id: 4, name: '비난하기', isAnswer: false),
          ],
        );
      default:
        return const Problem(
          title: '문제가 없습니다',
          content: '해당 ID에 대한 문제가 없습니다.',
          options: [],
        );
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
  Future<List<Worksheet>> getWorksheets() async {
    final List<Worksheet> worksheets = [
      // 개인 생활
      const Worksheet(
        id: '1',
        category: '개인 생활',
        title: '건강한 식단 만들기',
        imageUrl: 'assets/personal_food.png',
      ),
      const Worksheet(
        id: '2',
        category: '개인 생활',
        title: '운동 루틴 만들기',
        imageUrl: 'assets/personal_excersise.png',
      ),
      const Worksheet(
        id: '3',
        category: '개인 생활',
        title: '시간 관리 방법',
        imageUrl: 'assets/personal_daily.png',
      ),
      const Worksheet(
        id: '4',
        category: '개인 생활',
        title: '스트레스 관리',
        imageUrl: 'assets/personal_meditation.png',
      ),

      // 사회 생활
      const Worksheet(
        id: '5',
        category: '사회 생활',
        title: '사회 규칙 이해하기',
        imageUrl: 'assets/friendly_rule.png',
      ),
      const Worksheet(
        id: '6',
        category: '사회 생활',
        title: '지역사회 활동 참여하기',
        imageUrl: 'assets/social_activity.png',
      ),
      const Worksheet(
        id: '7',
        category: '사회 생활',
        title: '온라인 예절',
        imageUrl: 'assets/social_manner.png',
      ),
      const Worksheet(
        id: '8',
        category: '사회 생활',
        title: '금융 관리',
        imageUrl: 'assets/social_money.png',
      ),

      // 대인 관계
      const Worksheet(
        id: '9',
        category: '대인 관계',
        title: '친구 사귀기',
        imageUrl: 'assets/friendly_friend.png',
      ),
      const Worksheet(
        id: '10',
        category: '대인 관계',
        title: '의사소통 기술',
        imageUrl: 'assets/friendly_communication.png',
      ),
    ];
    return worksheets;
  }

  @override
  Future<List<SolveProblem>> getSolveProblems() async {
    // 각 Worksheet의 제목과 ID를 SolveProblem 리스트에 추가
    return [
      const SolveProblem(
        solvedWorksheetTitle: '건강한 식단 만들기',
        solvedWorksheetId: 1,
      ),
      const SolveProblem(
        solvedWorksheetTitle: '운동 루틴 만들기',
        solvedWorksheetId: 2,
      ),
      const SolveProblem(
        solvedWorksheetTitle: '시간 관리 방법',
        solvedWorksheetId: 3,
      ),
      const SolveProblem(
        solvedWorksheetTitle: '스트레스 관리',
        solvedWorksheetId: 4,
      ),
      const SolveProblem(
        solvedWorksheetTitle: '사회 규칙 이해하기',
        solvedWorksheetId: 5,
      ),
      const SolveProblem(
        solvedWorksheetTitle: '지역사회 활동 참여하기',
        solvedWorksheetId: 6,
      ),
      const SolveProblem(
        solvedWorksheetTitle: '온라인 예절',
        solvedWorksheetId: 7,
      ),
      const SolveProblem(
        solvedWorksheetTitle: '금융 관리',
        solvedWorksheetId: 8,
      ),
      const SolveProblem(
        solvedWorksheetTitle: '친구 사귀기',
        solvedWorksheetId: 9,
      ),
      const SolveProblem(
        solvedWorksheetTitle: '의사소통 기술',
        solvedWorksheetId: 10,
      ),
    ];
  }

}

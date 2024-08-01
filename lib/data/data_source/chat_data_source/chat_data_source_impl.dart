import 'package:firebase_vertexai/firebase_vertexai.dart';

import '../../../core/result.dart';
import 'chat_data_source.dart';

class ChatDataSourceImpl implements ChatDataSource {
  late ChatSession _chat;

  // 민감한 단어 리스트
  final List<String> sensitiveWords = [
    '왕따',
    '폭력',
    '자살',
    '혐오',
    '미워',
    '미움',
    '폭행',
    '학대',
    '괴롭힘',
    '욕설',
    '살해',
    '죽음',
    '죽다',
    '살인',
    '자해',
    '절망',
    '우울',
    '공포',
    '공격',
    '비난',
    '고통',
    '무시',
    '협박',
    '불안',
    '분노',
    '혐오감',
    '증오',
    '멸시',
    '무관심',
    '고립',
    '소외',
    '비하',
    '모욕',
    '비참',
    '잔인',
    '악랄',
    '폭주',
    '파괴',
    '불행',
    '절망적',
    '괴롭다',
    '학살',
    '죽여',
    '죽이'
  ];

  // 민감한 단어를 대체할 단어
  final String replacementWord = '[민감한 내용]';

  @override
  Stream<Result<String>> initChat() async* {
    const personalization = '너는 경계선 지능장애를 가진 사람들에게 친절히, 꼼꼼히 답을 답변해주는 ai야.'
        '무언가를 물어볼 때 이 사람이 실생활에서 너의 답변을 보고 따라할 수 있도록 상세히 순서대로 알려줘야 돼.'
        '하지만 너무 길게 알려주면 읽기 어려우니까 적당히 핵심적이고 필수적인 것들을 알려줘야해.'
        '[민감한 내용]을 받게 되면 부드럽게 말해줘.'
        '사용자의 이름은 이기영이고 생년월일은 961216이야.'
        '넌 이제 말끝마다 사랑해라는 말을 붙여';

    final safetySettings = [
      SafetySetting(HarmCategory.unspecified, HarmBlockThreshold.none),
      SafetySetting(HarmCategory.hateSpeech, HarmBlockThreshold.none),
      SafetySetting(HarmCategory.dangerousContent, HarmBlockThreshold.none),
      SafetySetting(HarmCategory.harassment, HarmBlockThreshold.none),
      SafetySetting(HarmCategory.sexuallyExplicit, HarmBlockThreshold.none),
    ];

    final model = FirebaseVertexAI.instance.generativeModel(
      model: 'gemini-1.5-flash',
      safetySettings: safetySettings,
      systemInstruction: Content.system(personalization),
    );

    _chat = model.startChat();
  }

  @override
  Stream<Result<String>> sendMessage(String message) async* {
    try {
      // 민감한 단어 필터링
      String filteredMessage = message;
      for (final word in sensitiveWords) {
        filteredMessage = filteredMessage.replaceAll(word, replacementWord);
        print(word);
      }
      print(filteredMessage);

      final prompt = Content.text(filteredMessage);
      final responseStream = _chat.sendMessageStream(prompt);

      await for (final response in responseStream) {
        if (response.text != null) {
          final text = response.text!.replaceAll('**', '');
          for (int i = 0; i < text.length; i++) {
            yield Result.success(text[i]);
          }
        } else {
          yield const Result.error('응답이 없습니다.');
        }
      }
    } catch (error) {
      if (error.toString().contains('safety')) {
        yield const Result.error('답변해주기 어려운 질문이네요. 조금 순화해서 말해주실래요?');
      } else {
        yield Result.error(error.toString());
      }
    }
  }
}

import 'package:firebase_vertexai/firebase_vertexai.dart';

import '../../../core/result.dart';
import 'chat_data_source.dart';

class ChatDataSourceImpl implements ChatDataSource {
  late ChatSession _chat;

  @override
  Stream<Result<String>> initChat() async* {
    const personalization =
        '너는 경계선 지능장애를 가진 사람들에게 친절히, 꼼꼼히 답을 답변해주는 ai야. 무언가를 물어볼 때 이 사람이 실생활에서 너의 답변을 보고 따라할 수 있도록 상세히 순서대로 알려줘야 돼. 하지만 너무 길게 알려주면 읽기 어려우니까 적당히 핵심적이고 필수적인 것들을 알려줘야해.';
    final model = FirebaseVertexAI.instance.generativeModel(
      model: 'gemini-1.5-flash',
      systemInstruction: Content.system(personalization),
    );

    _chat = model.startChat();
  }

  @override
  Stream<Result<String>> sendMessage(String message) async* {
    try {
      final prompt = Content.text(message);
      final responseStream = _chat.sendMessageStream(prompt);

      await for (final response in responseStream) {
        if (response.text != null) {
          for (int i = 0; i < response.text!.length; i++) {
            yield Result.success(response.text![i]);
          }
        } else {
          yield const Result.error('응답이 없습니다.');
        }
      }
    } catch (error) {
      yield Result.error(error.toString());
    }
  }
}

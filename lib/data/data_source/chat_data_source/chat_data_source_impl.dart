import 'package:firebase_vertexai/firebase_vertexai.dart';

import '../../../core/result.dart';
import 'chat_data_source.dart';

class ChatDataSourceImpl implements ChatDataSource {
  late ChatSession _chat;

  @override
  Stream<Result<String>> initChat() async* {
    final model =
        FirebaseVertexAI.instance.generativeModel(model: 'gemini-1.5-flash');

    _chat = model.startChat();
    print('Chat initialized'); // 디버깅 로그 추가
    yield const Result.success('Chat initialized');
  }

  @override
  Stream<Result<String>> sendMessage(String message) async* {
    try {
      print('Sending message: $message'); // 디버깅 로그 추가
      final prompt = Content.text(message);
      final responseStream = _chat.sendMessageStream(prompt);

      await for (final response in responseStream) {
        if (response.text != null) {
          print('Response received: ${response.text}'); // 디버깅 로그 추가
          yield Result.success(response.text!);
        } else {
          print('Response is null'); // 디버깅 로그 추가
          yield const Result.error('응답이 없습니다.');
        }
      }
    } catch (error) {
      print('Error: $error'); // 디버깅 로그 추가
      yield Result.error(error.toString());
    }
  }
}

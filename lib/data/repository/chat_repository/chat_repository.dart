
import '../../../core/result.dart';

abstract interface class ChatRepository {
  Stream<Result<String>> initChat();
  Stream<Result<String>> sendMessage(String message);
}
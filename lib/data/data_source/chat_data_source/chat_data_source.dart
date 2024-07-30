
import '../../../core/result.dart';

abstract interface class ChatDataSource {
  Stream<Result<String>> initChat();
  Stream<Result<String>> sendMessage(String message);
}
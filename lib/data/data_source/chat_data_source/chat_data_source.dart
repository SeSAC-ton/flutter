
import '../../../core/result.dart';
import '../../model/member/login/login_info.dart';
import '../../model/member/register/register_info.dart';

abstract interface class ChatDataSource {
  Stream<Result<String>> initChat();
  Stream<Result<String>> sendMessage(String message);
}
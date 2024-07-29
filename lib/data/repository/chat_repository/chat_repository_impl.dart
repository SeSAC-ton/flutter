import 'package:sesac_ton/data/data_source/chat_data_source/chat_data_source.dart';

import '../../../core/result.dart';
import 'chat_repository.dart';

class ChatRepositoryImpl implements ChatRepository {
  ChatDataSource chatDataSource;

  ChatRepositoryImpl(this.chatDataSource);

  @override
  Stream<Result<String>> initChat() => chatDataSource.initChat();

  @override
  Stream<Result<String>> sendMessage(String message) => chatDataSource.sendMessage(message);
}

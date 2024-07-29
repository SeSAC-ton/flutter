import 'package:flutter/material.dart';
import 'package:sesac_ton/core/result.dart';
import 'package:sesac_ton/data/repository/chat_repository/chat_repository.dart';

class ChatViewModel extends ChangeNotifier {
  final ChatRepository _chatRepository;

  ChatViewModel(this._chatRepository) {
    initChat();
  }

  List<String> _messages = [];
  String _currentMessage = '';

  List<String> get messages => _messages;

  String get currentMessage => _currentMessage;

  Future<void> initChat() async {
    _chatRepository.initChat().listen((result) {
      switch (result) {
        case Success<String>(:final data):
          _messages.add(data);
          notifyListeners();
        case Error<String>(:final e):
          print('Error: $e');
      }
    });
  }

  Future<void> sendMessage(String message) async {
    _messages.add("User: $message");
    notifyListeners();

    String tempMessages = '';

    await for (final result in _chatRepository.sendMessage(message)) {
      switch (result) {
        case Success(:final data):
          tempMessages += data;
          _currentMessage = tempMessages;
          notifyListeners();
        case Error(:final e):
          tempMessages += "Error: $e";
          _currentMessage = tempMessages;
          notifyListeners();
      }
    }

    _messages.add(tempMessages);
    _currentMessage = '';
    notifyListeners();
  }
}

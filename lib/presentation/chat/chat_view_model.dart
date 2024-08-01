import 'package:flutter/material.dart';
import 'package:sesac_ton/core/result.dart';
import 'package:sesac_ton/data/repository/chat_repository/chat_repository.dart';

class ChatViewModel extends ChangeNotifier {
  final ChatRepository _chatRepository;

  ChatViewModel(this._chatRepository) {
    initChat();
  }

  final List<String> _messages = [];
  final List<String> _userMessages = [];

  String _currentMessage = '';

  List<String> get messages => _messages;
  List<String> get userMessages => _userMessages;

  String get currentMessage => _currentMessage;

  Future<void> initChat() async {
    _chatRepository.initChat().listen((result) {
      switch (result) {
        case Success<String>(:final data):
          notifyListeners();
        case Error<String>(:final e):
          notifyListeners();
      }
    });
  }

  Future<void> sendMessage(String message) async {
    _userMessages.add(message);
    _currentMessage = '';
    notifyListeners();

    await for (final result in _chatRepository.sendMessage(message)) {
      switch (result) {
        case Success(:final data):
          _currentMessage += data;
        case Error(:final e):
          _currentMessage = "Error: $e";
      }
      notifyListeners();
    }

    _messages.add(_currentMessage);
    _currentMessage = '';
    notifyListeners();
  }
}

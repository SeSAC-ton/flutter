import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sesac_ton/presentation/chat/chat_view_model.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToBottom();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final viewModel = Provider.of<ChatViewModel>(context);
    viewModel.addListener(_safeScrollToBottom);
  }

  @override
  void dispose() {
    final viewModel = Provider.of<ChatViewModel>(context, listen: false);
    viewModel.removeListener(_safeScrollToBottom);
    _scrollController.dispose();
    _controller.dispose();
    super.dispose();
  }

  void _safeScrollToBottom() {
    // 현재 프레임에서 안전하게 스크롤을 수행하도록 추가
    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<ChatViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat with AI'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: viewModel.messages.length + (viewModel.currentMessage.isNotEmpty ? 1 : 0),
              itemBuilder: (context, index) {
                if (index < viewModel.messages.length) {
                  return ListTile(
                    title: Text(viewModel.messages[index]),
                  );
                } else {
                  return ListTile(
                    title: Text(viewModel.currentMessage),
                  );
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'Type your message...',
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    final message = _controller.text;
                    print('uimeesage: $message');
                    if (message.isNotEmpty) {
                      viewModel.sendMessage(message);
                      _controller.clear();
                      FocusScope.of(context).unfocus(); // 메시지를 보낸 후 키보드 닫기
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

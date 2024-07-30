import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sesac_ton/presentation/chat/chat_view_model.dart';
import 'package:sesac_ton/presentation/chat/component/chat_content_widget.dart';

import '../../ui/color_styles.dart';
import '../../ui/text_styles.dart';

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
    _scrollToBottom();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _controller.dispose();
    super.dispose();
  }


  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ChatViewModel>();
    final responses = viewModel.messages;
    final currentMessage = viewModel.currentMessage;
    final requests = viewModel.userMessages;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.pop();
          },
        ),
        centerTitle: true,
        title: Text(
          '챗봇',
          style: Fonts.largeTextBold.copyWith(
            color: ColorStyles.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                itemCount:
                    responses.length + (currentMessage.isNotEmpty ? 1 : 0),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ChatContentWidget(
                        request: requests[index],
                        response: (index < responses.length)
                            ? responses[index]
                            : currentMessage,
                      )
                    ],
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        hintStyle: Fonts.smallTextRegular.copyWith(
                          color: ColorStyles.black,
                        ),
                        hintText: '무엇이 궁금하신가요 ?',
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  ClipOval(
                    child: Container(
                      color: ColorStyles.white,
                      child: IconButton(
                        icon: const Icon(Icons.send),
                        onPressed: () {
                          final message = _controller.text;
                          if (message.isNotEmpty) {
                            viewModel.sendMessage(message);
                            _controller.clear();
                            FocusScope.of(context).unfocus();
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

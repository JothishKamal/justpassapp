import 'dart:developer';

import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:justpassapp/consts.dart';

class GeminiView extends StatefulWidget {
  const GeminiView({super.key});

  @override
  State<GeminiView> createState() => _GeminiViewState();
}

List<ChatMessage> _messages = <ChatMessage>[];

class _GeminiViewState extends State<GeminiView> {
  final Gemini gemini = Gemini.instance;

  final ChatUser _currentUser = ChatUser(
    id: '1',
    firstName: 'Aakash',
  );

  final ChatUser _geminiUser = ChatUser(id: '2', firstName: 'Gemini');

  final List<ChatUser> _typingUsers = <ChatUser>[];

  @override
  Widget build(BuildContext context) {
    if (_messages.isEmpty) {
      _messages.insert(
          0,
          ChatMessage(
              user: _geminiUser,
              createdAt: DateTime.now(),
              text: 'Hello, I am Gemini. How can I help you?'));
    }
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: primary,
        title: const Text(
          'Gemini Chat',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        color: const Color(0xFF102032),
        child: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: DashChat(
                currentUser: _currentUser,
                typingUsers: _typingUsers,
                onSend: (ChatMessage m) {
                  getChatResponse(m);
                },
                messages: _messages,
                messageOptions: const MessageOptions(
                  currentUserContainerColor: Color.fromARGB(255, 253, 253, 253),
                  containerColor: Color.fromARGB(255, 242, 255, 97),
                  textColor: Colors.black,
                  currentUserTextColor: Colors.black,
                ),
              ),
            )
          ],
        )),
      ),
    );
  }

  Future<void> getChatResponse(ChatMessage m) async {
    setState(() {
      _messages.insert(0, m);
      _typingUsers.add(_geminiUser);
    });
    try {
      String question = m.text;
      gemini.streamGenerateContent(question).listen((event) {
        ChatMessage? lastMessage = _messages.firstOrNull;
        if (lastMessage != null && lastMessage.user.id == _geminiUser.id) {
          lastMessage = _messages.removeAt(0);
          String response = event.content?.parts?.fold(
                  '', (previous, current) => "$previous${current.text}") ??
              '';
          lastMessage.text += response;
          setState(() {
            _messages = [lastMessage!, ..._messages];
          });
        } else {
          String response = event.content?.parts?.fold(
                  '', (previous, current) => "$previous${current.text}") ??
              '';
          ChatMessage msg = ChatMessage(
              user: _geminiUser, createdAt: DateTime.now(), text: response);
          setState(() {
            _typingUsers.remove(_geminiUser);
            _messages = [msg, ..._messages];
          });
        }
      });
    } catch (e) {
      log(e.toString());
    }
  }
}

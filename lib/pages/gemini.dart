import 'dart:developer';

import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class GeminiView extends StatefulWidget {
  const GeminiView({super.key});

  @override
  State<GeminiView> createState() => _GeminiViewState();
}

class _GeminiViewState extends State<GeminiView> {
  final Gemini gemini = Gemini.instance;

  final ChatUser _currentUser = ChatUser(
    id: '1',
    firstName: 'Aakash',
  );

  final ChatUser _geminiUser = ChatUser(id: '2', firstName: 'Gemini');

  List<ChatMessage> _messages = <ChatMessage>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFF102032),
        child: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
            Expanded(
              child: DashChat(
                currentUser: _currentUser,
                onSend: (ChatMessage m) {
                  getChatResponse(m);
                },
                messages: _messages,
                messageOptions: MessageOptions(
                  currentUserContainerColor: const Color(0xFFB9B9B9),
                  containerColor: const Color(0xFF4A90E2),

                  //TODO: Markdown doesn't work
                  markdownStyleSheet: MarkdownStyleSheet(
                    p: const TextStyle(color: Colors.pink),
                    h1: const TextStyle(color: Colors.white, fontSize: 20),
                    h2: const TextStyle(color: Colors.white, fontSize: 18),
                    h3: const TextStyle(color: Colors.white, fontSize: 16),
                    h4: const TextStyle(color: Colors.white, fontSize: 14),
                    h5: const TextStyle(color: Colors.white, fontSize: 12),
                    h6: const TextStyle(color: Colors.white, fontSize: 10),
                    em: const TextStyle(
                        color: Colors.white, fontStyle: FontStyle.italic),
                    strong: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                    code: const TextStyle(color: Colors.white),
                    codeblockPadding: const EdgeInsets.all(10),
                    codeblockDecoration: BoxDecoration(
                      color: const Color(0xFF315F95),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
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
            _messages = [msg, ..._messages];
          });
        }
      });
    } catch (e) {
      log(e.toString());
    }
  }
}

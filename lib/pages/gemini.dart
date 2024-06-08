import 'package:flutter/material.dart';

class GeminiView extends StatelessWidget {
  const GeminiView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF102032),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(onPressed: () {Navigator.pop(context);}, 
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  )
              ),
              Expanded(child: Container(child: Text('Gemini'))),
            ],
          ),
        ),
      ),
    );
  }
}
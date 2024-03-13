import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[100],
      body: Center(
        child: Text(
          "Your Companion - Devi \n(Yet to be implemented!)",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 35),
        ),
      ),
    );
  }
}

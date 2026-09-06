
import 'package:depi_project/model.dart';
import 'package:depi_project/widgets/about_widget.dart';
import 'package:flutter/material.dart';

class ChatTile extends StatelessWidget {
  final Chats chat;
  const ChatTile({super.key, required this.chat});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(chat.text),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AboutPage()),
              );
            },
            icon: const Icon(Icons.info_outline),
            padding: const EdgeInsets.only(right: 10),
          ),
        ],
      ),
      body: Center(
        child: Text("Chat with ${chat.text}", style: TextStyle(fontSize: 24)),
      ),
    );
  }
}

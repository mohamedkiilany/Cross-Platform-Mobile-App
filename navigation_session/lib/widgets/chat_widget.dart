
import 'package:depi_project/model.dart';
import 'package:depi_project/widgets/chat_tile_widget.dart';
import 'package:flutter/material.dart';

class ChatsWidget extends StatefulWidget {
  final Chats chat;
  const ChatsWidget({super.key, required this.chat});

  @override
  State<ChatsWidget> createState() => _ChatsWidgetState();
}

class _ChatsWidgetState extends State<ChatsWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: chat.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatTile(chat: chat[index]),
                ),
              );
            },
            title: Text(chat[index].text),
            subtitle: Text(chat[index].subtext),
            leading: CircleAvatar(
              backgroundColor: const Color.fromARGB(255, 185, 118, 226),
              radius: 20,
              child: Icon(Icons.person, color: Colors.white),
            ),
          );
        },
      ),
    );
  }
}
import 'package:depi_project/model.dart';
import 'package:depi_project/widgets/about_widget.dart';
import 'package:depi_project/widgets/call_widget.dart';
import 'package:depi_project/widgets/camera_widget.dart';
import 'package:depi_project/widgets/chat_widget.dart';
import 'package:flutter/material.dart';

class NavApplication extends StatefulWidget {
  const NavApplication({super.key});

  @override
  State<NavApplication> createState() => _NavApplicationState();
}

class _NavApplicationState extends State<NavApplication> {
  int selectedIndex = 0;
  List<Widget> pages = [
    CallsWidget(phone: phones[0]),
    CameraWidget(),
    ChatsWidget(chat: chat[0]),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedIndex == 0
            ? 'Calls'
            : selectedIndex == 1
                ? 'Camera'
                : 'Chats'),
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
      body: pages[selectedIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.call), label: 'Calls'),
          BottomNavigationBarItem(icon: Icon(Icons.camera), label: 'Camera'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chats'),
        ],
      ),
    );
  }
}





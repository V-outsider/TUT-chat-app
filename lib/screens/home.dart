import 'package:flutter/material.dart';
import 'chatPage.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChatPage(),
      /*bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey.shade600,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Chats',
            backgroundColor: Color(0xFF42A5F5),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group_work),
            label: 'Channels',
            backgroundColor: Color(0xFF42A5F5),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            label: 'Profile',
            backgroundColor: Color(0xFF42A5F5),
          ),
        ],
      ),*/
    );
  }
}

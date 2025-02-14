import 'package:chat_app/main.dart';
import 'package:chat_app/screen/chat_screen.dart';
import 'package:chat_app/screen/profile_screen.dart';
import 'package:chat_app/screen/splash_screen.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = ChatScreen();

    var activePageTitle = 'Flutter Chat App';

    if (_selectedPageIndex == 1) {
      activePage = ProfileScreen();
      activePageTitle = 'Profile';
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarTheme.backgroundColor,
        title: Text(activePageTitle),
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          currentIndex: _selectedPageIndex,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile')
          ]),
    );
  }
}

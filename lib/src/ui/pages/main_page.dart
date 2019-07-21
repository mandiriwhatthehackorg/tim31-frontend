import 'package:hepengta/src/ui/pages/profile_page.dart';
import 'package:hepengta/src/ui/pages/home.dart';
import 'package:hepengta/src/ui/fondation/colors.dart';
import 'package:flutter/material.dart';
import 'history_page.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [Home(), HistoryPage(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: new Text('Home')),
          BottomNavigationBarItem(
            icon: Icon(Icons.format_align_left),
            title: new Text('History')),
          BottomNavigationBarItem(
            icon: Icon(Icons.person), title: new Text('Profile'))
        ],
        fixedColor: Color(0xFF003D79),
        unselectedItemColor: AsphaltColor.black50,
        onTap: _onItemTapped,

      )
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

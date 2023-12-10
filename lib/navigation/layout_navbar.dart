import 'package:flutter/material.dart';
import 'package:flutter_application_1/menu/homepage.dart';
import 'package:flutter_application_1/menu/listresep.dart';
import 'package:flutter_application_1/menu/profile.dart';

class LayoutNavigationBar extends StatefulWidget {
  const LayoutNavigationBar({Key? key}) : super(key: key);

  @override
  _LayoutNavigationBarState createState() => _LayoutNavigationBarState();
}

class _LayoutNavigationBarState extends State<LayoutNavigationBar> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    HomeScreen(),
    ListResep(),
    Profile(),
  ];

  void onBarTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: _children[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          // type: BottomNavigationBarType.fixed, // Add this line
          currentIndex: _currentIndex,
          onTap: onBarTapped,
          selectedItemColor: Colors.orange,
          unselectedItemColor: Colors.black.withOpacity(0.5),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmark_border_rounded),
              label: 'Save',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}

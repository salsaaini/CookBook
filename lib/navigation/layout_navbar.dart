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
          currentIndex: _currentIndex,
          onTap: onBarTapped,
          // backgroundColor: Colors.orange,
          selectedItemColor: Colors.orange, // Warna ikon dan teks ketika dipilih
          unselectedItemColor: Colors.black.withOpacity(0.5), // Warna ikon dan teks ketika tidak dipilih
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home), // Tambahkan ikon untuk Home
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list_alt_rounded), // Tambahkan ikon untuk Daftar Resep
              label: 'Daftar Resep',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person), // Tambahkan ikon untuk Profile
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}

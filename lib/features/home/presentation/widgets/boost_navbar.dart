import 'package:brainboost/features/home/presentation/home.dart';
import 'package:flutter/material.dart';

class BoostNavBar extends StatefulWidget {
  @override
  _BoostNavBarState createState() => _BoostNavBarState();
}

class _BoostNavBarState extends State<BoostNavBar> {
  int _currentIndex = 0;

  // Screens to display
  final List<Widget> _pages = [
    Home(),
    Center(child: Text('Profile', style: TextStyle(fontSize: 24))),
    Center(child: Text('Settings', style: TextStyle(fontSize: 24))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true, // This ensures the body extends under the transparent bottom bar
      body:_pages[_currentIndex],
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent, // Set background to transparent
        elevation: 0, // Remove shadow
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent, // Transparent background
          elevation: 0, // No shadow
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          selectedItemColor: Colors.blue, // Selected icon color
          unselectedItemColor: Colors.grey, // Unselected icon color
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined,size: 20,),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline,size: 20,),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined,size: 20,),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}

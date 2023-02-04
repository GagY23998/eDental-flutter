import 'package:flutter/material.dart';

class TabScreen extends StatefulWidget {
  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _selectedIndex = 0;

  void onNavItemSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: prefer_const_literals_to_create_immutables
      bottomNavigationBar: BottomNavigationBar(
        // ignore: prefer_const_literals_to_create_immutables
        items: [
          const BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
          const BottomNavigationBarItem(
              label: 'Schedule', icon: Icon(Icons.attribution_rounded)),
          const BottomNavigationBarItem(
              label: 'Settings', icon: Icon(Icons.settings)),
        ],
        currentIndex: _selectedIndex,
        onTap: onNavItemSelected,
      ),
    );
  }
}

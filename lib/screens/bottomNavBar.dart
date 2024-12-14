import 'package:business_card_app/screens/analysis_screen.dart';
import 'package:business_card_app/screens/menu_screen.dart';
import 'package:business_card_app/screens/network_screen.dart';
import 'package:business_card_app/screens/profileScreen.dart';
import 'package:business_card_app/screens/qr_screen.dart';
import 'package:flutter/material.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({super.key});

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const ProfileListScreen(),
    const AnalyticsScreen(),
    const NetworkScreen(),
    const MenuScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: Color(0xFFC55536),
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.analytics), label: 'Analytics'),
          BottomNavigationBarItem(icon: Icon(Icons.apps), label: 'Network'),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Menu'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        shape:
            ContinuousRectangleBorder(borderRadius: BorderRadius.circular(500)),
        onPressed: () {
          setState(() {
            _currentIndex = 2; // Center button action
          });
        },
        backgroundColor: Color(0xFFC55536),
        child: const Icon(Icons.apps, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

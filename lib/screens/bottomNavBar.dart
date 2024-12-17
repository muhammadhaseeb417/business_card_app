import 'package:business_card_app/screens/analysis_screen.dart';
import 'package:business_card_app/screens/menu_screen.dart';
import 'package:business_card_app/screens/network_screen.dart';
import 'package:business_card_app/screens/profileScreen.dart';
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
    const Center(child: Text("QR Screen")),
    const NetworkScreen(),
    const MenuScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: SizedBox(
        height: 70,
        child: Stack(
          children: [
            // Bottom bar background
            Container(
              height: 70,
              color: Colors.white,
            ),
            // Bottom bar icons with manual spacing
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(0, "assets/Home.png", "Home"),
                _buildNavItem(1, "assets/analysis_icon.png", "Analytics"),
                const SizedBox(width: 20), // Space for the FloatingActionButton
                _buildNavItem(3, "assets/network.png", "Network"),
                _buildNavItem(4, "", "Menu", icon: Icons.menu),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(), // Ensures button is circular
        onPressed: () {
          setState(() {
            _currentIndex = 2; // Navigate to QR Screen
          });
        },
        backgroundColor: const Color(0xFFC55536),
        child: Image.asset("assets/scanIcon.png", height: 25),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  // Helper method to build navigation items
  Widget _buildNavItem(int index, String assetPath, String label,
      {IconData? icon}) {
    final bool isSelected = _currentIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon != null
              ? Icon(icon,
                  size: 28, color: isSelected ? Color(0xFFC55536) : Colors.grey)
              : Image.asset(
                  assetPath,
                  width: 24,
                  height: 24,
                  color: isSelected ? const Color(0xFFC55536) : Colors.grey,
                ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: isSelected ? const Color(0xFFC55536) : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

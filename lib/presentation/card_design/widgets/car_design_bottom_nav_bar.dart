import 'package:flutter/material.dart';

class CardDesingBottomNavBar extends StatelessWidget {
  const CardDesingBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(items: []);
  }

  BottomNavigationBarItem _customBottomNavBarItem() {
    return BottomNavigationBarItem(
      icon: Image.asset(""),
    );
  }
}

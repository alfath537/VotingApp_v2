import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int>? onTap;

  const BottomNavBar({super.key, required this.currentIndex, this.onTap});

  void _onItemTapped(BuildContext context, int index) {
    final currentRoute = ModalRoute.of(context)?.settings.name;

    switch (index) {
      case 0:
        if (currentRoute != '/home') {
          Navigator.pushReplacementNamed(context, '/home');
        }
        break;
      case 1:
        if (currentRoute != '/search') {
          Navigator.pushReplacementNamed(context, '/search');
        }
        break;
      case 2:
        if (currentRoute != '/saved') {
          Navigator.pushReplacementNamed(context, '/saved');
        }
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap ?? (index) => _onItemTapped(context, index),
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
        BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: 'Saved'),
      ],
    );
  }
}

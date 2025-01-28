import 'package:flutter/material.dart';
import 'package:scaleup_task/presentation/screen/home_screen/home_screen.dart';
import 'package:scaleup_task/presentation/screen/local_database_screen/local_database_screen.dart';

import 'presentation/screen/posts_data/api_calling_screen.dart';

class HandlerScreen extends StatefulWidget {
  const HandlerScreen({super.key});

  @override
  State<HandlerScreen> createState() => _HandlerScreenState();
}

class _HandlerScreenState extends State<HandlerScreen> {
  int _selectedIndex = 0; // Track selected tab index

  final List<Widget> _screens = [
    const HomeScreen(),
    const ApiCallingScreen(),
    const LocalDatabaseScreen(),
    const LocalDatabaseScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: IndexedStack(
        // Keeps the state of screens
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          height: 60,
          margin: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.6),
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    offset: const Offset(0, 20),
                    blurRadius: 20)
              ]),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24), // Clip the navigation bar
            child: BottomNavigationBar(
              backgroundColor: Colors.black,
              selectedItemColor: Colors.red,
              unselectedItemColor: Colors.white70,
              currentIndex: _selectedIndex,
              type: BottomNavigationBarType.fixed,
              onTap: _onItemTapped,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.tv),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.download),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: '',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

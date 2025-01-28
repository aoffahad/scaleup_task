import 'package:flutter/material.dart';
import 'package:scaleup_task/api_calling_screen.dart';
import 'package:scaleup_task/home_screen.dart';
import 'package:scaleup_task/local_database_screen.dart';

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
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      backgroundColor: Colors.purple,
      body: IndexedStack(
        // Keeps the state of screens
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          height: 60,
          // padding: const EdgeInsets.only(top: 5),
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
          child: BottomNavigationBar(
            backgroundColor: Colors.transparent,
            selectedItemColor: Colors.red,
            unselectedItemColor: Colors.white70,
            currentIndex: _selectedIndex,
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
            ],
          ),
        ),
      ),
    );
  }
}

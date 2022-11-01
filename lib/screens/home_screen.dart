import 'package:dashboard/screens/add_data.dart';
import 'package:dashboard/screens/blank_screen.dart';
import 'package:dashboard/screens/show_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/material/bottom_navigation_bar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  List pages = [ShowData(), AddData(), BlankScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home_work_outlined),
                label: "Show Data",
                backgroundColor: Color.fromARGB(255, 34, 71, 102)),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_circle_outline),
                label: "Add Data",
                backgroundColor: Color.fromARGB(255, 34, 71, 102)),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Person",
              backgroundColor: Color.fromARGB(255, 34, 71, 102),
            ),
          ],
          type: BottomNavigationBarType.fixed,
          // currentIndex: _selectedIndex,
          selectedItemColor: Color.fromARGB(255, 34, 55, 73),
          iconSize: 35,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          elevation: 3),
    );
  }
}

import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final String currentRoute;


  const BottomNavBar({Key? key,required this.currentRoute}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Color(0xFFFF6F61),
      unselectedItemColor: Colors.indigo,
      onTap: (index) {
        if (index == 0 && currentRoute != '/') {
          Navigator.pushReplacementNamed(context, '/');
        } else if (index == 1 && currentRoute != '/search') {
          Navigator.pushReplacementNamed(context, '/search');
        }
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
        ),
      ],
    );
  }
}

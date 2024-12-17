import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavigationBar({
    Key? key,
    required this.selectedIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.people),
          label: 'Doctors & Patients',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.local_hospital),
          label: 'Hospitals',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.book),
          label: 'My Reservation',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.folder),
          label: 'Medical File',
        ),
      ],
      currentIndex: selectedIndex,
      onTap: onTap,
      selectedItemColor: Colors.blue, // Customize as needed
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_sanar_proj/Screens/add_Patient.dart';
import 'package:flutter_sanar_proj/Screens/medicines.dart';

import '../../Screens/home_screen.dart';

class BottomAppBarSelectionForDoctorHomePage extends StatefulWidget {
  const BottomAppBarSelectionForDoctorHomePage({super.key});

  @override
  State<BottomAppBarSelectionForDoctorHomePage> createState() =>
      _BottomAppBarSelectionForDoctorHomePageState();
}

class _BottomAppBarSelectionForDoctorHomePageState
    extends State<BottomAppBarSelectionForDoctorHomePage> {
  List<Widget> screens = [
    Center(child: MedicinesScreen()),
    Center(child: HomeScreen()),
    const Center(child: RegistrationScreen()),
  ];
  int selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: screens.elementAt(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        backgroundColor: Colors.teal,
        selectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.medication_liquid_outlined), label: 'Medicines'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add Patient'),
        ],
      ),
    );
  }
}

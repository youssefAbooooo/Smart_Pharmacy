import 'package:flutter/material.dart';
import 'package:flutter_sanar_proj/Screens/patient_home.dart';
import 'package:flutter_sanar_proj/Screens/qrcode.dart';

class BottomAppBarSelectionForPatientHomePage extends StatefulWidget {
  const BottomAppBarSelectionForPatientHomePage({super.key});

  @override
  State<BottomAppBarSelectionForPatientHomePage> createState() =>
      _BottomAppBarSelectionForPatientHomePageState();
}

class _BottomAppBarSelectionForPatientHomePageState
    extends State<BottomAppBarSelectionForPatientHomePage> {
  List<Widget> screens = [
    Center(child: PatientHome()),
    Center(child: QRGeneratorScreen()),
    const Center(child: Text('QR Code Scanner')),
  ];
  int selectedIndex = 0;
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
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.qr_code), label: 'QR Code'),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/prescription.dart';
import 'medicine_details_screen.dart';
import '../Widgets/y_widgets/rpd_button.dart';

class MedicinesScreen extends StatelessWidget {
  const MedicinesScreen({super.key});

  Stream<List<Prescription>> _getMedicines() {
    return FirebaseFirestore.instance
        .collection('prescriptions')
        .snapshots()
        .map((snapshot) => snapshot.docs
        .map((doc) => Prescription.fromJson(doc.data()))
        .toList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Medicines',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        backgroundColor: const Color(0xFF009688), // Teal color
        elevation: 0,
      ),
      body: StreamBuilder<List<Prescription>>(
        stream: _getMedicines(),
        builder: (BuildContext context, AsyncSnapshot<List<Prescription>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }

          final medicines = snapshot.data ?? [];

          if (medicines.isEmpty) {
            return const Center(
              child: Text('No medicines found'),
            );
          }

          return ListView.builder(
            itemCount: medicines.length,
            padding: const EdgeInsets.all(16),
            itemBuilder: (BuildContext context, int index) {
              final medicine = medicines[index];
              return Container(
                margin: const EdgeInsets.only(bottom: 16),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Text(
                      medicine.name,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: RejectPendinDoneButton(
                            icon: Icons.add,
                            onpressed: () {},
                            color: const Color(0xFFFFC107), // Yellow
                            content: "Update\nMedicine",
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: RejectPendinDoneButton(
                            icon: Icons.remove_red_eye_outlined,
                            onpressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const MedicineDetailsScreen(),
                                  settings: RouteSettings(arguments: medicine),
                                ),
                              );
                            },
                            color: Colors.green,
                            content: "Medicine\nDetails",
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    RejectPendinDoneButton(
                      icon: Icons.remove_circle_outline,
                      onpressed: () {},
                      color: Colors.red,
                      content: "Remove\nMedicine",
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
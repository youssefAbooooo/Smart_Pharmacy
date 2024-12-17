import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class SelectedMedicineScreen extends StatefulWidget {
  const SelectedMedicineScreen({super.key});

  @override
  State<SelectedMedicineScreen> createState() => _SelectedMedicineScreenState();
}

class _SelectedMedicineScreenState extends State<SelectedMedicineScreen> {
  final List<String> medicineImages = [
    'assets/images/capsules.png',
    'assets/images/capsules2.png',
    'assets/images/article1.png',
  ];

  final List<String> medicineNames = [
    'Paracetamol',
    'Ibuprofen',
    'Aspirin',
    'Antihistamine',
    'Amoxicillin',
  ];

  String searchText = '';
  String? selectedMedicine;

  @override
  Widget build(BuildContext context) {
    final filteredMedicines = medicineNames
        .where((medicine) =>
            medicine.toLowerCase().contains(searchText.toLowerCase()))
        .toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Select Medicine',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.teal,
        iconTheme: const IconThemeData(
          color: Colors.white, // Set the back arrow icon color to white
        ),
      ),
      body: Column(
        children: [
          // Header Section with Slider and Search
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.teal, Colors.tealAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            padding: const EdgeInsets.only(bottom: 20),
            child: Column(
              children: [
                // Medicine Slider
                CarouselSlider(
                  options: CarouselOptions(
                    autoPlay: true,
                    height: 180.0,
                    autoPlayInterval: const Duration(seconds: 3),
                    enlargeCenterPage: true,
                  ),
                  items: medicineImages.map((imagePath) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                              image: AssetImage(imagePath),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
                const SizedBox(height: 16),

                // Search Bar
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Material(
                    elevation: 5,
                    shadowColor: Colors.teal.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10),
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Search Medicine',
                        labelStyle: const TextStyle(color: Colors.teal),
                        prefixIcon:
                            const Icon(Icons.search, color: Colors.teal),
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.teal, width: 2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          searchText = value;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Medicine List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: filteredMedicines.length,
              itemBuilder: (context, index) {
                final medicine = filteredMedicines[index];
                return Card(
                  elevation: 5,
                  margin: const EdgeInsets.only(bottom: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    leading: const CircleAvatar(
                      backgroundColor: Colors.teal,
                      child: Icon(Icons.medical_services, color: Colors.white),
                    ),
                    title: Text(
                      medicine,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.teal),
                    ),
                    trailing: selectedMedicine == medicine
                        ? const Icon(Icons.check_circle, color: Colors.teal)
                        : null,
                    onTap: () {
                      setState(() {
                        selectedMedicine = medicine;
                      });

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('$medicine selected'),
                          backgroundColor: Colors.teal,
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

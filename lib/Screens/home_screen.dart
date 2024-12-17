import 'package:flutter/material.dart';
import 'package:flutter_sanar_proj/Widgets/y_widgets/patient_container.dart';
import 'package:flutter_sanar_proj/Widgets/y_widgets/search_bar.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final List<String> names = [
    'Amr Hassan',
    'Youssef Samy',
    'Reham Said',
    'Mostafa Ahmed'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home Page',
          style: TextStyle(color: Colors.white),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: MySearchBar(),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return PatientContainer(name: names[index]);
                },
                childCount: names.length, // Total number of items in the list
              ),
            ),
          ],
        ),
      ),
    );
  }
}

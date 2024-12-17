import 'package:flutter/material.dart';
import 'package:flutter_sanar_proj/Widgets/y_widgets/patient_container.dart';
import 'package:flutter_sanar_proj/Widgets/y_widgets/search_bar.dart';

class MedicinesScreen extends StatefulWidget {
  MedicinesScreen({super.key});

  @override
  State<MedicinesScreen> createState() => _MedicinesScreenState();
}

class _MedicinesScreenState extends State<MedicinesScreen> {
  final List<String> names = [
    'Concor 5 Plus',
    'Zurcal',
    'Natrilix-SR',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Medicines',
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
                childCount: names.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

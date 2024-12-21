import 'package:flutter/material.dart';
import 'package:flutter_sanar_proj/Widgets/y_widgets/patient_container.dart';
import 'package:flutter_sanar_proj/Widgets/y_widgets/rpd_button.dart';
import 'package:flutter_sanar_proj/Widgets/y_widgets/search_bar.dart';
import 'package:flutter_sanar_proj/models/patients1.dart';

class MedicinesScreen extends StatefulWidget {
  MedicinesScreen({super.key});

  @override
  State<MedicinesScreen> createState() => _MedicinesScreenState();
}

class _MedicinesScreenState extends State<MedicinesScreen> {
  final List<String> medicinesList = [
    'Concor 5 Plus',
    'Zurcal',
    'Natrilix-SR',
    'Concor 5 Plus',
    'Zurcal',
    'Natrilix-SR',
    'Concor 5 Plus',
    'Zurcal',
    'Natrilix-SR',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                  return MedicinesContainer(
                    medicine: medicinesList[index],
                  );
                },
                childCount: medicinesList.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MedicinesContainer extends StatelessWidget {
  const MedicinesContainer({super.key, required this.medicine});
  final String medicine;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 4.0),
      padding: const EdgeInsets.all(2),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0X19000000), //the color of the shadow
            blurRadius: 20,
            offset:
                Offset(0, 8), //this numbers specify the location of the shadow
          )
        ],
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Column(
        children: [
          Text(
            medicine,
            style: const TextStyle(fontSize: 22),
          ),
          const SizedBox(height: 6),
          Column(
            children: [
              Row(
                children: [
                  RejectPendinDoneButton(
                      icon: Icons.add,
                      onpressed: () {},
                      color: const Color(0XFFFDC008),
                      content: "     Update\n    Medicine"),
                  const SizedBox(
                    width: 20,
                  ),
                  RejectPendinDoneButton(
                      icon: Icons.remove_red_eye_outlined,
                      onpressed: () {},
                      color: Colors.green,
                      content: "   Medicine\n   Details"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(flex: 1),
                  RejectPendinDoneButton(
                      icon: Icons.remove_circle_outline,
                      onpressed: () {},
                      color: Colors.red,
                      content: "    remove\n    Medicine"),
                  const Spacer(flex: 1),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

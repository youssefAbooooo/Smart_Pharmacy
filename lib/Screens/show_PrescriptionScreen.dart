import 'package:flutter/material.dart';
import 'package:flutter_sanar_proj/Widgets/y_widgets/rpd_button.dart';
import 'package:flutter_sanar_proj/Widgets/y_widgets/search_bar.dart';

class ShowPrescriptionScreen extends StatelessWidget {
  // final List<String> names = ['Concor 5 Plus', 'Zurcal', 'Natrilix-SR'];

  const ShowPrescriptionScreen({super.key, required this.prescriptionList});

  final List<dynamic> prescriptionList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text(
          'Prescriptions',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white, // Set the back arrow icon color to white
        ),
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
                  return PrescriptionContainer(name: prescriptionList[index]);
                },
                childCount: prescriptionList
                    .length, // Total number of items in the list
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PrescriptionContainer extends StatelessWidget {
  const PrescriptionContainer({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6.0),
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
          Row(
            children: [
              const Text(
                ' Name :  ',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                name,
                style: const TextStyle(fontSize: 22),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              const SizedBox(width: 20),
              RejectPendinDoneButton(
                  icon: Icons.remove_red_eye_outlined,
                  onpressed: () {},
                  color: Colors.green,
                  content: "Medicine\nDetails"),
              const SizedBox(width: 20),
              RejectPendinDoneButton(
                  icon: Icons.remove_circle_outline,
                  onpressed: () {},
                  color: Colors.red,
                  content: "remove\nMedicines"),
            ],
          )
        ],
      ),
    );
  }
}

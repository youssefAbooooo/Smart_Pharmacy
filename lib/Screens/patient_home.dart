import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sanar_proj/Widgets/y_widgets/rpd_button.dart';
import 'package:flutter_sanar_proj/Widgets/y_widgets/search_bar.dart';
import 'package:flutter_sanar_proj/models/prescription.dart';

class PatientHome extends StatelessWidget {
  PatientHome({super.key});

  CollectionReference prescriptions =
      FirebaseFirestore.instance.collection('prescriptions');

  List<Prescription> prescriptionsList = [];

  @override
  Widget build(BuildContext context) {
    Widget showHomeScreen() {
      return Scaffold(
        backgroundColor: Colors.white,
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
              // const SliverToBoxAdapter(
              //   child: MySearchBar(),
              // ),
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Your Prescriptions',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return PrescriptionContainer(
                        prescription: prescriptionsList[index]);
                  },
                  childCount: prescriptionsList
                      .length, // Total number of items in the list
                ),
              ),
            ],
          ),
        ),
      );
    }

    return StreamBuilder(
      stream: prescriptions.snapshots(),
      builder: (context, snapchot) {
        if (snapchot.hasData) {
          prescriptionsList = [];
          for (var i = 0; i < snapchot.data!.docs.length; i++) {
            prescriptionsList
                .add(Prescription.fromJson(snapchot.data!.docs[i]));
          }
          // print(snapchot.data!.docs[0]['name']);
          // print(patientsList[0].name);
        }
        return showHomeScreen();
      },
    );
  }
}

class PrescriptionContainer extends StatelessWidget {
  const PrescriptionContainer({
    super.key,
    required this.prescription,
  });

  final Prescription prescription;

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
            prescription.name,
            style: const TextStyle(fontSize: 22),
          ),
          const SizedBox(height: 6),
          RejectPendinDoneButton(
              onpressed: () {
                Navigator.pushNamed(context, '/medicineDetailsScreen',
                    arguments: prescription);
              },
              color: Colors.pink,
              content: 'Medicine Details',
              icon: Icons.remove_red_eye_outlined)
        ],
      ),
    );
  }
}

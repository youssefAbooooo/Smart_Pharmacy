import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sanar_proj/Widgets/y_widgets/patient_container.dart';
import 'package:flutter_sanar_proj/Widgets/y_widgets/search_bar.dart';
import 'package:flutter_sanar_proj/models/patients1.dart';

class HomeScreen extends StatelessWidget {
  final names = ['youssef', 'mohamed'];

  CollectionReference patients =
      FirebaseFirestore.instance.collection('patients1');

  HomeScreen({super.key});
  List<Patients1> patientsList = [];

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
              const SliverToBoxAdapter(
                child: MySearchBar(),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return PatientContainer(patient: patientsList[index]);
                  },
                  childCount:
                      patientsList.length, // Total number of items in the list
                ),
              ),
            ],
          ),
        ),
      );
    }

    return StreamBuilder(
      stream: patients.snapshots(),
      builder: (context, snapchot) {
        if (snapchot.hasData) {
          patientsList = [];
          for (var i = 0; i < snapchot.data!.docs.length; i++) {
            patientsList.add(Patients1.fromJson(snapchot.data!.docs[i]));
          }
          // print(snapchot.data!.docs[0]['name']);
          // print(patientsList[0].name);
        }
        return showHomeScreen();
      },
    );
  }
}

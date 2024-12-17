import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sanar_proj/Screens/show_PrescriptionScreen.dart';
import 'package:flutter_sanar_proj/models/patients1.dart';
import 'rpd_button.dart';

class PatientContainer extends StatelessWidget {
  const PatientContainer({
    super.key,
    required this.patient,
  });

  final Patients1 patient;

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
                'Name :  ',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                patient.name,
                style: const TextStyle(fontSize: 22),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Column(
            children: [
              Row(
                children: [
                  RejectPendinDoneButton(
                      icon: Icons.add,
                      onpressed: () {
                        Navigator.pushNamed(context, '/SelectedMedicineScreen');
                      },
                      color: const Color(0XFFFDC008),
                      content: "       Add\nPrescription"),
                  const SizedBox(
                    width: 20,
                  ),
                  RejectPendinDoneButton(
                      icon: Icons.remove_red_eye_outlined,
                      onpressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ShowPrescriptionScreen(
                              prescriptionList: patient.prescriptions,
                            ),
                          ),
                        );
                      },
                      color: Colors.green,
                      content: "      Show\nPrescription"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(flex: 1),
                  RejectPendinDoneButton(
                      icon: Icons.remove_circle_outline,
                      onpressed: () async {
                        FirebaseFirestore firestore =
                            FirebaseFirestore.instance;

                        // Query to find the document with the specific name
                        QuerySnapshot querySnapshot = await firestore
                            .collection('patients1')
                            .where('name', isEqualTo: patient.name)
                            .get();

                        // Check if any documents match the query
                        if (querySnapshot.docs.isNotEmpty) {
                          // Delete the first matching document
                          // If you expect multiple documents, you might want to handle this differently
                          await querySnapshot.docs.first.reference.delete();
                        }
                      },
                      color: Colors.red,
                      content: "     remove\n     Patient"),
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

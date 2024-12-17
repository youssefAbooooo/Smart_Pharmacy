import 'package:flutter/material.dart';
import 'package:flutter_sanar_proj/Screens/show_PrescriptionScreen.dart';
import 'rpd_button.dart';

class PatientContainer extends StatelessWidget {
  const PatientContainer({
    super.key,
    required this.name,
  });

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
                'Name :  ',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                name,
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
                                builder: (context) =>
                                    ShowPrescriptionScreen()));
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
                      onpressed: () {},
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

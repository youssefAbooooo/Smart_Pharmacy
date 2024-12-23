import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sanar_proj/Login-Signup/login.dart';
import 'package:flutter_sanar_proj/Login-Signup/login_signup.dart';
import 'package:flutter_sanar_proj/On_Board/on_boarding.dart';
import 'package:flutter_sanar_proj/Screens/medicine_details_screen.dart';
import 'package:flutter_sanar_proj/Screens/patient_home.dart';
import 'package:flutter_sanar_proj/Screens/screen1.dart';
import 'package:flutter_sanar_proj/Screens/selected_medicine.dart';
import 'package:flutter_sanar_proj/Widgets/y_widgets/bottom_app_bar.dart';
import 'package:flutter_sanar_proj/Widgets/y_widgets/bottom_app_bar_for_patient_home.dart';
import 'package:flutter_sanar_proj/firebase_options.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          routes: {
            '/': (context) => const Screen1(),
            '/on_boarding': (context) => const on_boarding(),
            '/Login_Signup': (context) => const LoginSignup(),
            '/LoginPage': (context) => const LogInPage(),
            '/homescreen': (context) =>
                const BottomAppBarSelectionForDoctorHomePage(),
            '/SelectedMedicineScreen': (context) =>
                const SelectedMedicineScreen(),
            'patient_home': (context) =>
                const BottomAppBarSelectionForPatientHomePage(),
            '/medicineDetailsScreen': (context) => MedicineDetailsScreen(),
          },
        );
      },
    );
  }
}

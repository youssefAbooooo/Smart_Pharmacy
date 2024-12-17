import 'package:flutter/material.dart';
import 'package:flutter_sanar_proj/Login-Signup/forget_password.dart';
import 'package:flutter_sanar_proj/Widgets/Colors/colors.dart';
import 'package:flutter_sanar_proj/Widgets/Login_Signup_Textfileds.dart/custom_email_field.dart';
import 'package:flutter_sanar_proj/Widgets/Login_Signup_Textfileds.dart/custom_password_field.dart';
import 'package:page_transition/page_transition.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final TextEditingController emailPhoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Stack(
          children: [
            // Background image
            Positioned.fill(
              child: Image.asset(
                'assets/images/pageScreen@2x.png',
                fit: BoxFit.cover,
              ),
            ),
            // Back arrow button
            Positioned(
              top: 40, // Adjust as needed for padding from top
              left: 16, // Adjust as needed for padding from left
              child: IconButton(
                icon: Icon(Icons.arrow_back, color: blackColor),
                onPressed: () {
                  Navigator.pushNamed(context, '/Login_Signup');
                },
              ),
            ),
            // Foreground content with scrolling
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                            height: 80), // Adjust for spacing below the arrow
                        Center(
                          child: Text(
                            "Log In",
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: blackColor,
                            ),
                          ),
                        ),
                        const SizedBox(height: 40),
                        CustomEmailField(
                          controller: emailPhoneController,
                          label: 'Email',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        CustomPasswordField(
                          controller: passwordController,
                          label: 'Password',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(
                                  context,
                                  PageTransition(
                                    type: PageTransitionType.rightToLeft,
                                    child: ForgetPasswordScreen(),
                                  ),
                                );
                              },
                              child: Text(
                                "Forgot your password?",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: primaryColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                Navigator.pushNamed(context, '/homescreen');
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primaryColor,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text(
                              'Log In',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: whiteColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

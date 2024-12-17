import 'package:flutter/material.dart';
import 'package:flutter_sanar_proj/Widgets/Colors/colors.dart';
import 'package:flutter_sanar_proj/Widgets/Login_Signup_Textfileds.dart/custom_email_field.dart';
import 'package:flutter_sanar_proj/Widgets/Login_Signup_Textfileds.dart/phone_field.dart';

class ForgetPasswordScreen extends StatefulWidget {
  @override
  _ForgetPasswordScreenState createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isEmailSelected = true;

  void sendOTP() {
    if (_formKey.currentState!.validate()) {
      if (isEmailSelected) {
        print('Sending OTP to Email: ${emailController.text}');
      } else {
        print('Sending OTP to Phone: ${phoneController.text}');
      }
    }
  }

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
            // Full-screen background image
            Positioned.fill(
              child: Image.asset(
                'assets/images/pageScreen@2x.png',
                fit: BoxFit.cover,
              ),
            ),
            // Content with an arrow at the top left and centered form
            SafeArea(
              child: Column(
                children: [
                  // Top-left arrow
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back, color: blackColor),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.all(16.0),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Enter your email or phone number to reset your password.',
                                style: TextStyle(
                                    fontSize: 16.0, color: blackColor),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 20.0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ChoiceChip(
                                    label: Text('Email'),
                                    selected: isEmailSelected,
                                    onSelected: (bool selected) {
                                      setState(() {
                                        isEmailSelected = true;
                                      });
                                    },
                                    selectedColor: primaryColor,
                                    backgroundColor: whiteColor,
                                    labelStyle: TextStyle(
                                      color: isEmailSelected
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                  SizedBox(width: 10.0),
                                  ChoiceChip(
                                    label: Text('Phone'),
                                    selected: !isEmailSelected,
                                    onSelected: (bool selected) {
                                      setState(() {
                                        isEmailSelected = false;
                                      });
                                    },
                                    selectedColor: primaryColor,
                                    backgroundColor: whiteColor,
                                    labelStyle: TextStyle(
                                      color: !isEmailSelected
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20.0),
                              isEmailSelected
                                  ? CustomEmailField(
                                      controller: emailController,
                                      label: 'Email',
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter your email';
                                        }
                                        final emailRegex = RegExp(
                                            r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                                        if (!emailRegex.hasMatch(value)) {
                                          return 'Enter a valid email';
                                        }
                                        return null;
                                      },
                                    )
                                  : PhoneField(
                                      controller: phoneController,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter your phone';
                                        }
                                        return null;
                                      },
                                    ),
                              SizedBox(height: 20.0),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: sendOTP,
                                  child: Text(
                                    'Send OTP',
                                    style: TextStyle(color: whiteColor),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: primaryColor,
                                    padding:
                                        EdgeInsets.symmetric(vertical: 16.0),
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
          ],
        ),
      ),
    );
  }
}

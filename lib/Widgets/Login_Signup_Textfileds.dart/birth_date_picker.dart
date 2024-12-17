import 'package:flutter/material.dart';
import 'package:flutter_sanar_proj/Widgets/Colors/colors.dart';
import 'package:intl/intl.dart';

class BirthDatePicker extends StatefulWidget {
  final Function(DateTime?) onDateSelected;
  final Color primaryColor;

  const BirthDatePicker({
    Key? key,
    required this.onDateSelected,
    required this.primaryColor,
  }) : super(key: key);

  @override
  _BirthDatePickerState createState() => _BirthDatePickerState();
}

class _BirthDatePickerState extends State<BirthDatePicker> {
  DateTime? birthDate;
  bool isFocused = false;

  Future<void> _selectBirthDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData(
            primaryColor: widget.primaryColor, // Set primary color
            colorScheme: ColorScheme.light(
              primary: widget.primaryColor, // Header background color
              onPrimary: Colors.white, // Header text color
              onSurface: Colors.black, // Body text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                  // primary: widget.primaryColor, // Button text color
                  ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (pickedDate != null && pickedDate != birthDate) {
      setState(() {
        birthDate = pickedDate;
        widget.onDateSelected(birthDate);
      });
    }
    setState(() {
      isFocused = false; // Remove focus after date is selected
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isFocused = true;
        });
        _selectBirthDate(context);
      },
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: 'Birth Date',
          labelStyle: TextStyle(
            color: isFocused
                ? primaryColor
                : Colors.grey, // Label color changes when focused
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(
              color: isFocused
                  ? primaryColor
                  : Colors.grey, // Border color when focused
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(
              color:
                  isFocused ? primaryColor : greyColor, // Default border color
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: isFocused
                  ? primaryColor
                  : greyColor, // Border color when focused
            ),
          ),
          prefixIcon: Icon(
            Icons.calendar_today,
            color: isFocused
                ? primaryColor
                : greyColor, // Icon color changes when focused
          ),
        ),
        child: Text(
          birthDate != null
              ? DateFormat('yyyy-MM-dd').format(birthDate!)
              : 'Select your birth date',
          style: TextStyle(
            color:
                isFocused ? primaryColor : greyColor, // Text color when focused
          ),
        ),
      ),
    );
  }
}

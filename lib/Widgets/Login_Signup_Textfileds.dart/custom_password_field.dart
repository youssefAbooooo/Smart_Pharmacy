import 'package:flutter/material.dart';
import 'package:flutter_sanar_proj/Widgets/Colors/colors.dart';

class CustomPasswordField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final TextInputType inputType;
  final String? Function(String?)? validator; // Add validator parameter

  const CustomPasswordField({
    Key? key,
    required this.controller,
    required this.label,
    this.inputType = TextInputType.text,
    this.validator,
  }) : super(key: key);

  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;
  bool _isPasswordVisible = false; // Track password visibility
  bool _hasError = false; // Track error state
// Store error text

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Theme(
          data: Theme.of(context).copyWith(
            textSelectionTheme: TextSelectionThemeData(
              selectionColor:
                  _hasError ? redColor : primaryColor.withOpacity(0.5),
              selectionHandleColor: _hasError ? redColor : primaryColor,
            ),
          ),
          child: TextFormField(
            controller: widget.controller,
            focusNode: _focusNode,
            cursorColor: primaryColor,
            obscureText: !_isPasswordVisible, // Toggle password visibility
            keyboardType: widget.inputType,
            validator: (value) {
              final error = widget.validator?.call(value);
              setState(() {
                _hasError = error != null;
              });
              return error; // Return the error message
            },
            decoration: InputDecoration(
              labelText: widget.label,
              labelStyle: TextStyle(
                color: _hasError
                    ? redColor // Change color to red if there's an error
                    : (_isFocused ? primaryColor : greyColor),
              ),
              prefixIcon: Icon(
                Icons.lock,
                color: _hasError
                    ? redColor // Change color to red if there's an error
                    : (_isFocused ? primaryColor : greyColor),
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                  color: _hasError
                      ? redColor
                      : _isPasswordVisible
                          ? primaryColor
                          : greyColor,
                ),
                onPressed: () {
                  setState(() {
                    _isPasswordVisible =
                        !_isPasswordVisible; // Toggle visibility
                  });
                },
              ),
              border: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(12.0), // Added border radius
                borderSide: BorderSide(
                  color: _hasError
                      ? redColor // Change border color to red if there's an error
                      : (_isFocused ? primaryColor : greyColor),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(12.0), // Same border radius for focus
                borderSide: BorderSide(
                  color: _hasError ? redColor : primaryColor,
                  width: 2.0, // Thickness of the border when focused
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                    12.0), // Rounded borders for normal state
                borderSide: BorderSide(
                  color: _hasError ? redColor : greyColor,
                  width: 1.0,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

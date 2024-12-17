import 'package:flutter/material.dart';
import 'package:flutter_sanar_proj/Widgets/Colors/colors.dart';

class PhoneField extends StatefulWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const PhoneField({
    Key? key,
    required this.controller,
    this.validator,
  }) : super(key: key);

  @override
  State<PhoneField> createState() => _PhoneFieldState();
}

class _PhoneFieldState extends State<PhoneField> {
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;
  bool _hasError = false;

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
            keyboardType: TextInputType.phone,
            focusNode: _focusNode,
            cursorColor: primaryColor,
            validator: (value) {
              final error = widget.validator?.call(value);
              setState(() {
                _hasError = error != null;
              });
              return error;
            },
            decoration: InputDecoration(
              labelText: 'Phone',
              labelStyle: TextStyle(
                color: _hasError
                    ? redColor
                    : (_isFocused ? primaryColor : greyColor),
              ),
              prefixIcon: Icon(
                Icons.phone,
                color: _hasError
                    ? redColor
                    : (_isFocused ? primaryColor : greyColor),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide(
                  color: _hasError
                      ? redColor
                      : (_isFocused ? primaryColor : greyColor),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide(
                  color: _hasError ? redColor : primaryColor,
                  width: 2.0,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
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

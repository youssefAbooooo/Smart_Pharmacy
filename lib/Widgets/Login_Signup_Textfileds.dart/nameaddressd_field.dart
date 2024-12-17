import 'package:flutter/material.dart';
import 'package:flutter_sanar_proj/Widgets/Colors/colors.dart';

class NameAddressdField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final IconData icon;

  const NameAddressdField({
    Key? key,
    required this.controller,
    required this.label,
    required this.icon,
  }) : super(key: key);

  @override
  State<NameAddressdField> createState() => _NameAddressdFieldState();
}

class _NameAddressdFieldState extends State<NameAddressdField> {
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

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
    return TextFormField(
      controller: widget.controller,
      focusNode: _focusNode,
      cursorColor: primaryColor,
      keyboardType: TextInputType.streetAddress,
      decoration: InputDecoration(
        labelText: widget.label,
        labelStyle: TextStyle(
          color: _isFocused ? primaryColor : greyColor,
        ),
        prefixIcon: Icon(
          widget.icon,
          color: _isFocused ? primaryColor : greyColor,
        ), // Adds the icon before the label text
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(
            color: _isFocused ? primaryColor : greyColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(
            color: primaryColor,
            width: 2.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(
            color: greyColor,
            width: 1.0,
          ),
        ),
      ),
    );
  }
}

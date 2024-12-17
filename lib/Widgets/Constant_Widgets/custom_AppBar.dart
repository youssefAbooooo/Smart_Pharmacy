import 'package:flutter/material.dart';
import 'package:flutter_sanar_proj/Widgets/Colors/colors.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final VoidCallback onBackPress;

  const CustomAppBar({
    Key? key,
    required this.title,
    required this.onBackPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
      child: Row(
        children: [
          IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: blackColor,
              size: 30,
            ),
            onPressed: onBackPress,
          ),
          Expanded(
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: blackColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

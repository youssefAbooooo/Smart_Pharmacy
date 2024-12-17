import 'package:flutter/material.dart';

class RejectPendinDoneButton extends StatelessWidget {
  const RejectPendinDoneButton({
    super.key,
    required this.onpressed,
    required this.color,
    required this.content,
    required this.icon,
  });
  final Function() onpressed;
  final Color color;
  final String content;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: onpressed,
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.white,
            ),
            Text(content, style: const TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}

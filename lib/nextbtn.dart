import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({Key? key, required this.onPressed, required this.label}) : super(key: key);

  final VoidCallback? onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      
      child: SizedBox(
        height: 50,
        width: 160,
        child: Card(
          color: onPressed != null ? Colors.orange : const Color.fromARGB(255, 158, 12, 1),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 23,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
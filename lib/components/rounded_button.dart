import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({Key? key, this.colour = Colors.blue, this.buttonText = 'Button', required this.onPressed}) : super(key: key);

  final Color colour;

  final String buttonText;

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 10.0,
        color: colour,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200.0,
          height: 55.0,
          child: Text(
            buttonText,
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}

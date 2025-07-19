import 'package:flutter/material.dart';

class StarterButton extends StatelessWidget {
  const StarterButton({super.key, this.onPressed});
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(
          horizontal: 32,
          vertical: 16,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 4,
        textStyle: const TextStyle(
          inherit: true,
          fontSize: 18,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.1,
          height: 1.4,
          decoration: TextDecoration.none,
          // optional for full parity
          backgroundColor: Colors.transparent,
          wordSpacing: 0.0,
          decorationThickness: 1.0,
        ),
      ),
      child: const Text('Create Account'),
    );
  }
}

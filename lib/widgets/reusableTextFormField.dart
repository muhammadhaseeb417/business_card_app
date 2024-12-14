// Reusable Text Form Field Widget
import 'package:flutter/material.dart';

class ReusableTextFormField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final bool obscureText;

  const ReusableTextFormField({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        TextFormField(
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Colors.grey,
                width: 1,
              ),
            ),
            suffixIcon: obscureText
                ? const Icon(Icons.visibility_off)
                : const SizedBox(),
          ),
        ),
      ],
    );
  }
}

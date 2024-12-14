import 'package:flutter/material.dart';

// Reusable TextFormField widget
class Roundedreusabletextfield extends StatelessWidget {
  final String labelText;
  final TextEditingController? controller;

  const Roundedreusabletextfield({
    super.key,
    required this.labelText,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(color: Colors.grey, fontSize: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 12.0,
          ),
        ),
      ),
    );
  }
}
